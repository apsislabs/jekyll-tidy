require 'test_helper'

class Jekyll::TidyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Tidy::VERSION
  end

  def test_outputs_clean_html
    dirty_html = load_fixture('dirty.html')
    expected = load_fixture('clean.html')
    actual = Jekyll::Tidy.output_clean(dirty_html)

    assert_equal expected, actual
  end

  def test_outputs_compressed_html
    dirty_html = load_fixture('dirty.html')
    expected = load_fixture('compressed.html')
    actual = Jekyll::Tidy.output_clean(dirty_html, true)

    assert_equal expected, actual
  end
end
