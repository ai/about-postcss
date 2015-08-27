class PostcssHighlighter < Highlighter
  def none(code)
    code
  end

  def default_highlight(code)
    code.gsub(/(true|false|null|nil)/,'<mark>\0</mark>')
        .gsub(/"[^"]+"|'[^']+'/,      '<mark>\0</mark>')
        .gsub(/(\s|^)(#[^\{].*$)/,    '\1<mark class="comment">\2</mark>')
        .gsub(/(\(|\[|,|^|\s|=)(\d+(px|deg|%|m?s|))(\)|,|$|\s|;)/,
          '\\1<mark>\\2</mark>\\4')
  end

  def css(code)
    code.gsub(/^([^\s].*){/,     '<mark>\1</mark>{')
        .gsub(/\/\*.*\*\//,      '<mark class="comment">\0</mark>')
        .gsub(/^    ([^\s:]*):/, '    <mark>\1</mark>:')
  end

  def sass(code)
    code.gsub(/\..*/,         '<mark>\0</mark>')
        .gsub(/\+.*/,         '<mark>\0</mark>')
        .gsub(/(@|\$)[\w-]*/, '<mark>\0</mark>')
        .gsub(/\/\/.*/,       '<mark class="comment">\0</mark>')
  end

  def mark_rem(code)
    css(code).gsub(/\d+rem/, '<mark class="important">\0</mark>')
  end

  def js(code)
    default_highlight(code)
      .gsub(/(\s|^)(if|var|function|return|=&gt;|let)/, '\1<mark>\2</mark>')
      .gsub(/\/[^<>\/]+\//, '<mark>\0</mark>')
  end

  def mark_postcss(code)
    js(code).gsub(/postcss\([^\)]+\)/, '<mark class="important">\0</mark>')
  end

  def mark_webp(code)
    css(code.gsub(/\.webp/, '<mark class="important">\0</mark>'))
  end

  def mark_left(code)
    css(code.gsub(/left/, '<mark class="important">\0</mark>'))
  end

  def mark_right(code)
    css(code.gsub(/right/, '<mark class="important">\0</mark>'))
  end

  def mark_template(code)
    code.gsub(/&lt;[^\n]*&gt;/, '<mark>\0</mark>')
  end

  def mark_plugin(code)
    js(code).gsub(/plugin\d/, '<mark class="important">\0</mark>')
  end

  def mark_vars(code)
    css(code).gsub(/\$\w+/, '<mark class="important">\0</mark>')
  end

  def mark_nested(code)
    code.gsub(/([^\s].*)\{/, '<mark>\1</mark>{')
        .gsub(/&amp;|@\w+/, '<mark class="important">\0</mark>')
  end

  def mark_mixins(code)
    code.gsub(/@[\w-]+/, '<mark class="important">\0</mark>')
        .gsub(/\$\w+/, '<mark>\0</mark>')
  end

  def mark_css4(code)
    css(code).gsub(/var\([^)]+\)/, '<mark class="important">\0</mark>')
             .gsub(/--heading/, '<mark class="important">\0</mark>')
             .gsub(/blackness\([^)]+\)/, '<mark class="important">\0</mark>')
             .gsub(/small-caps/, '<mark class="important">\0</mark>')
  end

  def mark_prefixes(code)
    css(code).gsub(/-(webkit|ms|moz|o)-/, '<mark class="important">\0</mark>')
  end

  def mark_data(code)
    css(code).gsub(/data:…/, '<mark class="important">\0</mark>')
  end

  def mark_ie(code)
    css(code).gsub(/\*\w+|filter/, '<mark class="important">\0</mark>')
  end

  def mark_case1(code)
    js(code).gsub(/autoprefixer/, '<mark class="important">\0</mark>')
  end

  def mark_case2(code)
    js(code).gsub(/cssnext|postcss-\w+/, '<mark class="important">\0</mark>')
  end

  def mark_case3(code)
    js(code).gsub(/precss/, '<mark class="important">\0</mark>')
  end

  def comment(code)
    code.gsub(/.*/, '<mark class="comment">\0</mark>')
  end

  def mark_context(code)
    code.gsub(/^(\s*[^\s].*){/, '<mark>\1</mark>{')
        .gsub(/([^\s:]*):/,     '<mark>\1</mark>:')
        .gsub(/@context/,       '<mark class="important">\0</mark>')
  end

  def mark_font(code)
    css(code).gsub(/Alice/, '<mark class="important">\0</mark>')
  end

  def mark_face(code)
    css(code).gsub(/@font-face/, '<mark class="important">\0</mark>')
  end

  def mark_use(code)
    css(code).gsub(/@use|responsive \d+px \d+px/,
      '<mark class="important">\0</mark>')
  end
end
