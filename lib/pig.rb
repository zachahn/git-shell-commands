require "yaml"

class Pig
  def initialize(string)
    @string = string
    @codes = []
  end

  def to_s
    color_codes = @codes.join(";")

    "\e[#{color_codes}m#{@string}\e[0m"
  end

  def method_missing(method, *args)
    if !colors.include?(method)
      return super
    end

    @codes.push(color_hash[method])

    self
  end

  def respond_to_missing(method, _)
    if colors.include?(method)
      true
    else
      super
    end
  end

  private

  def color_hash
    @color_hash ||= YAML.load(File.read(__FILE__).split(/^__END__$\n/)[1])
  end

  def colors
    color_hash.keys
  end
end

if $0 == __FILE__
  require "minitest/autorun"

  class PigTest < Minitest::Test
    def test_red_text
      assert_equal("\e[31mFork man\e[0m", Pig.new("Fork man").red.to_s)
    end
  end
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
