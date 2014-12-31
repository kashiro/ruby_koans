require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutKeywordArguments < Neo::Koan

  def method_with_keyword_arguments(one: 1, two: 'two')
    [one, two]
  end

  def test_keyword_arguments
    assert_equal Array, method_with_keyword_arguments.class
	# TODO keyとvalueでメソッド定義すると、引数の変数宣言とデフォルト設定ができる
    assert_equal [1, "two"], method_with_keyword_arguments
    assert_equal ["one", "two"], method_with_keyword_arguments(one: 'one')
    assert_equal [1,2], method_with_keyword_arguments(two: 2)
  end

  def method_with_keyword_arguments_with_mandatory_argument(one, two: 2, three: 3)
    [one, two, three]
  end

  def test_keyword_arguments_with_wrong_number_of_arguments
    exception = assert_raise (ArgumentError) do
	  # key value形式で引数を宣言してデフォルト設定がある状態だと引数なしでも実行可能
	  # ただしこのように、一つでもデフォルト設定ができていないとエラーになる
      method_with_keyword_arguments_with_mandatory_argument
    end
    assert_match(/wrong number of arguments/, exception.message)
  end

  # THINK ABOUT IT:
  #
  # Keyword arguments always have a default value, making them optional to the caller

end
