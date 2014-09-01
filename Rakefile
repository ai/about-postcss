require 'pathname'
require 'base64'

ROOT   = Pathname(__FILE__).dirname
COMMON = ROOT.join('common')

require 'redcarpet'
require 'evil-front-all'
require 'active_support/core_ext'

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
    `file -ib #{file}`.split(';').first
  end

  def include_statistics
    COMMON.join('_statistics.html').read
  end
end

class Highlighter < Redcarpet::Render::HTML
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

  def none(code)
    code
  end

  def default_highlight(code)
    code.gsub(/(true|false|null|nil)/,'<mark>\\0</mark>')
        .gsub(/"[^"]+"|'[^']+'/,      '<mark>\\0</mark>')
        .gsub(/(\s|^)(#[^\{].*$)/,    '\\1<mark class="comment">\\2</mark>')
        .gsub(/(\(|\[|,|^|\s|=)(\d+(px|deg|%|m?s|))(\)|,|$|\s|;)/,
          '\\1<mark>\\2</mark>\\4')
  end

  def css(code)
    code.gsub(/^([^\s].*){/,     '<mark>\\1</mark>{')
        .gsub(/\/\*.*\*\//,      '<mark class="comment">\\0</mark>')
        .gsub(/^    ([^\s:]*):/, '    <mark>\\1</mark>:')
  end

  def sass(code)
    code.gsub(/\..*/,         '<mark>\\0</mark>')
        .gsub(/\+.*/,         '<mark>\\0</mark>')
        .gsub(/(@|\$)[\w-]*/, '<mark>\\0</mark>')
        .gsub(/\/\/.*/,       '<mark class="comment">\\0</mark>')
  end

  def mark_sass(code)
    code.gsub(/\..*/, '<mark>\\0</mark>')
        .gsub(/\+.*/, '<mark class="important">\\0</mark>')
  end

  def mark_rem(code)
    css(code).gsub(/\d+rem/, '<mark class="important">\\0</mark>')
  end

  def colon(code)
    code.gsub(/:+/, '<mark class="important">\\0</mark>')
  end

  def js(code)
    default_highlight(code)
      .gsub(/if|var|function|\/[^<>\/]+\/|return/, '<mark>\\0</mark>')
  end

  def mark_fix(code)
    css(code).gsub(/a:after/, '<mark class="important">\\0</mark>')
  end

  def mark_postcss(code)
    js(code).gsub(/postcss\([^\)]+\)/, '<mark class="important">\\0</mark>')
  end

  def mark_font(code)
    css(code.gsub(/font-size: .*/, '<mark class="important">\\0</mark>'))
  end

  def mark_webp(code)
    css(code.gsub(/\.webp/, '<mark class="important">\\0</mark>'))
  end

  def mark_left(code)
    css(code.gsub(/left/, '<mark class="important">\\0</mark>'))
  end

  def mark_right(code)
    css(code.gsub(/right/, '<mark class="important">\\0</mark>'))
  end

  def mark_phone(code)
    code.gsub(/--phone/,          '<mark class="important">\\0</mark>')
        .gsub(/@[^\s]+/,          '<mark>\\0</mark>')
        .gsub(/body/,             '<mark>\\0</mark>')
        .gsub(/^(\s+)([^\s:]*):/, '\\1<mark>\\2</mark>:')
  end
end

class Builder
  include EvilFront::Helpers
  include Helpers

  def self.load
    @cache ||= self.new
  end

  def initialize(build_type = :development)
    @build_type = build_type
  end

  def add_gem_assets(env, gem)
    path = Gem::Specification.find_by_name(gem).gem_dir
    path = Pathname(path).join('vendor/assets')
    path.each_child { |path| env.append_path(path) }
  end

  def assets
    @sprockets ||= begin
      Sprockets::Environment.new(ROOT) do |env|
        add_gem_assets(env, 'rails-assets-shower-core')
        add_gem_assets(env, 'rails-assets-shower-bright')

        EvilFront.install_all(env)
        Slim::Engine.set_default_options(pretty: false, format: :html5)

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
  end

  def title
    @title ||= caption.match(/<h1>(.*)<\/h1>/m).try(:[], 1)
  end

  def caption
    @caption ||= markdown.render(sections.first)
  end

  def markdown
    @renderer ||= begin
      Redcarpet::Markdown.new(Highlighter.new, fenced_code_blocks: true)
    end
  end

  def sections
    @sections ||= ROOT.join('postcss.md').read
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
    options = { format: :html5, disable_escape: true, pretty: false }
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
  html = ROOT.join('./build/postcss.html')
  html.dirname.mkpath
  html.open('w') { |io| io << Builder.new(:standalone).to_html }
end

desc 'Run server for development'
task :server do
  require 'sinatra/base'

  class WebSlides < Sinatra::Base
    set :lock, true

    get '/' do
      builder = Builder.load
      builder.reload!
      builder.to_html
    end

    {
      css: 'text/css',  js:  'text/javascript',
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

    def assets
      @assets ||= Builder.new.assets
    end
  end

  WebSlides.run!
end
