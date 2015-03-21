require "yaml"

Colors = YAML.load(File.read(__FILE__).split(/^__END__$\n/)[1]).freeze

def C(str, *colors)
  color_codes = colors.map { |c| Colors[c] }.join(";")

  "\e[#{color_codes}m#{str}\e[0m"
end

__END__
:black: 30
:red: 31
:green: 32
:yellow: 33
:blue: 34
:magenta: 35
:cyan: 36
:white: 37

:bold: 1

