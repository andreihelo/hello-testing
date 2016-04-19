require 'hello/version'

module Hello
  class Language
    attr_reader :l, :d, :n, :words, :cases

    def initialize(file)
      ldn_values = file[0].split(' ')
      @l = ldn_values[0].to_i
      @d = ldn_values[1].to_i
      @n = ldn_values[2].to_i
      @words = []
      @cases = []
      (file[1..@d]).each do |word|
        @words << word
      end
      (file[(@d + 1)..-1]).each do |kase|
        @cases << kase
      end
    end

    def match
      cases.map do |kase|
        regex = Regexp.new(kase.gsub('(', '[').gsub(')', ']'))
        words.inject(0) do |acc, word|
          regex.match(word) ? acc + 1 : acc
        end
      end
    end
  end
end
