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
        new_word = Word.new(word, @l)
        @words << word if new_word
      end
      (file[(@d + 1)..-1]).each do |kase|
        @cases << kase
      end
    end

    def match
      cases.each_with_index.map do |kase, i|
        regex = Regexp.new(kase.gsub('(', '[').gsub(')', ']'))
        count = words.inject(0) do |acc, word|
          regex.match(word) ? acc + 1 : acc
        end
        "Case ##{i + 1}: #{count}"
      end
    end
  end

  class Word
    attr_reader :value

    def initialize(value, l)
      value.size.eql?(l.to_i) ? @value = value : nil
    end
  end

  class Case
    def initialize(value)

    end
  end
end
