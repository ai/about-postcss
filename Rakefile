require 'pathname'
require 'base64'

ROOT   = Pathname(__FILE__).dirname
COMMON = ROOT.join('common')

require 'redcarpet'
require 'evil-front-all'
require 'active_support'
require 'active_support/core_ext'
require 'rails-assets-shower-core'
require 'rails-assets-shower-bright'

JqueryCdn.local_url = proc { '/jquery.js' }

class Slide
  attr_accessor :html, :types

  def initialize(builder, text, number)
    @builder = builder
    @types   = []

    commands = []
    text.gsub!(/^!.*\n/) do |line|
      line = line.split(' ')
      name = line.first[1..-1]
      if respond_to? name
        send(name, *line[1..-1])
      else
        commands << [name, line[1..-1]]
        ''
      end
    end

    @html = @builder.markdown.render(text)
    @html = EvilFront::Russian.typograph_html(@html)
    @html = EvilFront::Russian.auto_flying_quotes(@html)
    @html.gsub!("<li>\n", '<li>')
    commands.each { |(name, params)| send(name + '=', *params) }
  rescue => e
    $stderr.puts "Error in slide ##{ number + 1 }"
    $stderr.puts
    raise e
  end

  def type=(type)
    @types << type
  end

  def cover=(name)
    @html += image('covers/' + name)
    @types << 'cover h'
  end

  def image(name)
    url = if @builder.development?
      name
    else
      unless @builder.assets[name]
        $stderr.puts "No image #{ name }"
        exit(1)
      end

      @builder.inline_image(name)
    end

    "<img src=\"#{ url }\" alt=\"#{ name }\">"
  end

  def gem(path)
    name, path = path.split('/', 2)
    root = Gem::Specification.find_by_name(name).gem_dir
    Pathname(root).join(path).read
  end
end

module Helpers
  def standalone?
    @build_type == :standalone
  end

  def development?
    @build_type == :development
  end

  def inline_image(name)
    file = assets[name].pathname
    type = file_type(file)
    encode_image(file, type)
  end

  def encode_image(file, type)
    "data:#{type};base64," + Base64.encode64(file.read)
  end

  def file_type(file)
    MIME::Types.type_for(file.to_s).first.content_type
  end

  def include_statistics
    COMMON.join('_statistics.html').read
  end
end

class Highlighter < Redcarpet::Render::HTML
  def self.reload!
    if Object.const_defined? 'PostcssHighlighter'
      Object.send(:remove_const, 'PostcssHighlighter')
    end
  end

  def block_code(code, lang)
    lines = code.lines.map do |line|
      line = EvilFront.escape(line)

      if lang and respond_to? lang
        send(lang, line)
      else
        default_highlight(line)
      end
    end

    '<pre>' + lines.map { |i| "<code>#{ i }</code>" }.join + '</pre>'
  end
end

class Builder
  include EvilFront::Helpers
  include Helpers

  attr_reader :lang

  def self.load(lang = 'en')
    @cache       ||= { }
    @cache[lang] ||= self.new(lang)
  end

  def initialize(lang, build_type = :development)
    @build_type = build_type
    @lang       = lang
  end

  def assets
    @sprockets ||= begin
      Sprockets::Environment.new(ROOT) do |env|
        RailsAssets.load_paths.each { |i| env.append_path(i) }

        EvilFront.install_all(env)

        env.append_path(ROOT)
        env.append_path(COMMON)
        env.append_path(ROOT.join('images'))

        env.context_class.class_eval do
          def asset_path(path, options = {})
            ''
          end
        end

        unless development?
          env.js_compressor  = Uglifier.new(copyright: false)
          env.css_compressor = :csso
        end
      end
    end
  end

  def reload!
    @title    = nil
    @slides   = nil
    @caption  = nil
    @sections = nil
    @renderer = nil
    Highlighter.reload!
  end

  def title
    @title ||= caption.match(/<h1>(.*)<\/h1>/m).try(:[], 1)
  end

  def caption
    @caption ||= markdown.render(sections.first)
  end

  def markdown
    @renderer ||= begin
      load ROOT.join('postcss_highlighter.rb').to_s
      Redcarpet::Markdown.new(PostcssHighlighter.new, fenced_code_blocks: true)
    end
  end

  def sections
    @sections ||= ROOT.join("postcss.#{ @lang }.md").read
      .split(/^##/).map.with_index do |text, index|
        index == 0 ? text : '##' + text
      end
  end

  def slides
    slides = sections[1..-1] || []
    @slides ||= slides.map.with_index { |s, i| Slide.new(self, s, i) }
  end

  def to_html
    layout  = COMMON.join('layout.slim')
    options = { format: :html, disable_escape: true, pretty: false }
    Slim::Template.new(layout.to_s, options).render(self)
  end
end

require 'term/ansicolor'
include Term::ANSIColor

desc 'Remove generated files'
task :clean do
  build = ROOT.join('./build/')
  build.rmtree if build.exist?
end

desc 'Build presentations all-in-one files'
task :build => :clean do
  %w(ru en).each do |lang|
    html = ROOT.join("./build/postcss.#{lang}.html")
    html.dirname.mkpath
    html.open('w') { |io| io << Builder.new(lang, :standalone).to_html }
    print '.'
  end
  puts
end

desc 'Run server for development'
task :server do
  require 'sinatra/base'

  class WebSlides < Sinatra::Base
    set :lock, true

    get '/' do
      '<a href="/en">English</a> <a href="/ru">Русский</a>'
    end

    {
      css: 'text/css',  js:  'text/javascript', svg: 'image/svg+xml',
      png: 'image/png', jpg: 'image/jpeg', ico: 'image/vnd.microsoft.icon'
    }.each_pair do |ext, mime|
      get "/*.#{ ext }" do |path|
        content_type mime

        path  = path + ".#{ ext }"
        asset = Builder.load.assets[path]

        if asset.nil?
          status 404
          "no #{path} asset"
        elsif ext == :css or ext == :js
          asset.to_s
        else
          send_file asset.pathname
        end
      end
    end

    get '/:lang' do
      builder = Builder.load(params[:lang])
      builder.reload!
      builder.to_html
    end

    def assets
      @assets ||= Builder.new.assets
    end
  end

  WebSlides.run!
end
