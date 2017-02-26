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

  def test_matches_file_globs_correctly
    config_override = {"jekyll_tidy" => {"exclude" => ["_posts/**", "**/fail.html", "_only_md/*.md"]} }

    assert Jekyll::Tidy.exclude?("_posts/index.html", config_override)
    refute Jekyll::Tidy.exclude?("_pages/index.html", config_override)

    assert Jekyll::Tidy.exclude?("_pages/fail.html", config_override)
    refute Jekyll::Tidy.exclude?("fail.html", config_override)

    assert Jekyll::Tidy.exclude?("_only_md/test.md", config_override)
    refute Jekyll::Tidy.exclude?("_only_md/test.html", config_override)
  end
end
