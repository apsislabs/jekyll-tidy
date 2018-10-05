# Jekyll::Tidy

[![Build Status](https://travis-ci.org/apsislabs/jekyll-tidy.svg?branch=master)](https://travis-ci.org/apsislabs/jekyll-tidy) [![Gem Version](https://badge.fury.io/rb/jekyll-tidy.svg)](https://badge.fury.io/rb/jekyll-tidy)

`jekyll-tidy` is a plugin for tidying the HTML output of your Jekyll website, using either [`HtmlBeautifier`](https://github.com/threedaymonk/htmlbeautifier) or [`HtmlCompressor`](https://github.com/paolochiodi/htmlcompressor).

## Usage

Usage is straightforward.

### via Bundler

If you have the gem Bundler installed, simply include the gem in your `Gemfile` under the `:jekyll_plugins` group:

```ruby
group :jekyll_plugins do
  gem "jekyll-tidy"
end
```
Run `bundle install` to install the plugin and its dependencies.<br/>
The plugin will be automatically loaded the next time you run `bundle exec jekyll build` or `bundle exec jekyll serve`

### via config file

The plugin-gem can also be loaded via the `_config.yml`<br/>
Simply add this gem to the `gems:` list (or `plugins:` list, if you're on Jekyll v3.5 and above.)

```yaml
gems:
  - jekyll-tidy
```

## Configuration

`jekyll-tidy` takes three configuration settings:

  * `exclude` &mdash; an array of files to exclude from tidying.
  * `ignore_env` &mdash; a `JEKYLL_ENV` string on which to skip tidying entirely.
  * `compress_html` &mdash; a flag for whether or not to compress the HTML output

```yaml
jekyll_tidy:
  exclude: ["index.html"]
  ignore_env: development
  compress_html: true  # or false
```

### exclude (default: [])

`exclude` is an array of relative file paths that will be ignored by `jekyll-tidy`. Exclude must be set as an array, or it will cause errors.

```yaml
jekyll_tidy:
  exclude: ["index.html"]  # excludes only index.html
```

`exclude` can also take a glob of file paths.<br/>
**Note:** File globs need to be wrapped with `""` when defining the array with square brackets.

```yaml
jekyll_tidy:
  exclude: ["_posts/*.md"]  # excludes all markdown files directly within the _posts directory.
```

```yaml
jekyll_tidy:
  exclude:
    - _posts/*.md     # excludes all markdown files directly within the _posts directory.
    - _posts/**/*.md  # excludes all markdown files anywhere within the _posts directory
```

### compress_html (default: false)

If `compress_html` is set to `true` then `HtmlCompressor` will be used to tidy the markup.
When set to `false`, `HtmlBeautifier` will be used to tidy the markup.

**Note**: if you set the `compress_html` option to `true` and your templates have inline CSS or javascript, it will not be minified.

### ignore_env (default: nil)

If `ignore_env` is set to a string, we will check the `JEKYLL_ENV` environment variable and skip tidying if it matches.

Setting `_config.yml` with:

```yaml
ignore_env: development
```

and then running jekyll server with:

```sh
$ JEKYLL_ENV=development jekyll serve
```

will skip all tidying.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apsislabs/jekyll-tidy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

---

# Built by Apsis

[![apsis](https://s3-us-west-2.amazonaws.com/apsiscdn/apsis.png)](https://www.apsis.io)

`jekyll-tidy` was built by Apsis Labs. We love sharing what we build! Check out our [other libraries on Github](https://github.com/apsislabs), and if you like our work you can [hire us](https://www.apsis.io/work-with-us/) to build your vision.
