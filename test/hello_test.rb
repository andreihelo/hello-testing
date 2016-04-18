require 'test_helper'

class HelloTest < Minitest::Test
  def setup
    @file = [
      '3 5 4',
      'abc',
      'bca',
      'dac',
      'dbc',
      'cba',
      '(ab)(bc)(ca)',
      'abc',
      '(abc)(abc)(abc)',
      '(zyx)bc'
    ]

    @hello = Hello::Language.new(@file)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Hello::VERSION
  end

  def test_it_has_l_d_n_values
    assert_equal 3, @hello.l
    assert_equal 5, @hello.d
    assert_equal 4, @hello.n
  end

  def test_it_has_tokens
    assert_equal 5, @hello.tokens.size
  end

  def test_it_has_expected_tokens
    expected_tokens = %w[abc bca dac dbc cba]

    assert_equal expected_tokens, @hello.tokens
  end

  def test_it_has_valid_words
    
  end

  def test_it_has_cases
    assert_equal 4, @hello.cases.size
  end

  def test_it_has_expected_cases
    expected_cases = %w[(ab)(bc)(ca) abc (abc)(abc)(abc) (zyx)bc]

    assert_equal expected_cases, @hello.cases
  end

  def test_it_verify_words_versus_cases
    expected_result = [2, 1, 3, 0]

    assert_equal expected_result, @hello.match
  end
end
