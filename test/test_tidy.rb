require "helper"

module Jekyll
  class TidyTest < Minitest::Test
    def setup_fixtures(overrides = {})
      Tidy.init(Utils.deep_merge_hashes(Configuration::DEFAULTS, overrides))
    end

    def test_that_it_has_a_version_number
      refute_nil Tidy::VERSION
    end

    def test_outputs_clean_html
      setup_fixtures

      dirty_html = load_fixture("dirty.html")
      expected = load_fixture("clean.html")
      actual = Tidy.output_clean(dirty_html)

      assert_equal expected, actual
    end

    def test_outputs_compressed_html
      setup_fixtures({
        "jekyll_tidy" => {
          "compress_html" => true,
        },
      })

      dirty_html = load_fixture("dirty.html")
      expected = load_fixture("compressed.html")
      actual = Tidy.output_clean(dirty_html)

      assert_equal expected, actual
    end

    def test_matches_file_globs_correctly
      setup_fixtures({
        "jekyll_tidy" => {
          "exclude" => ["_posts/*", "_test/**/*", "**/fail.html", "_only_md/*.md"],
        },
      })

      excluded_samples = %w(
        _posts/index.md _posts/index.html
        _test/foo.md _test/pages/foo.html
        _pages/fail.html _pages/test/fail.html fail.html
        _only_md/test.md
      )

      non_excluded_samples = %w(
        _posts/test/index.html
        _pages/index.md
        _only_md/test.html
      )

      excluded_samples.each do |file|
        assert Tidy.exclude?(file)
      end

      non_excluded_samples.each do |file|
        refute Tidy.exclude?(file)
      end
    end
  end
end
