# Jekyll::Tidy

[![Build Status](https://travis-ci.org/apsislabs/jekyll-tidy.svg?branch=master)](https://travis-ci.org/apsislabs/jekyll-tidy) [![Gem Version](https://badge.fury.io/rb/jekyll-tidy.svg)](https://badge.fury.io/rb/jekyll-tidy)

`jekyll-tidy` is a plugin for tidying the HTML output of your Jekyll website, using either `htmlbeautifier` or `htmlcompressor`.

## Usage

Usage is straightforward. Simply include the gem in your `Gemfile` with:

```ruby
  gem 'jekyll-tidy'
```

And then include the plugin in a file located in your `_plugins` directory. 

You can also include the plugin using the `plugins` option in your `_config.yml` file, like so:

```
  plugins: 
    - jekyll-tidy
```

**Note**: if you set the `compress_html` option to `true` and your templates have inline CSS or javascript, it will not be minified.

## Configuration

`jekyll-tidy` takes three configuration settings, an array of files to exclude, a flag for whether or not to compress the HTML output and a `JEKYLL_ENV` string on which to skip tidying.

```
  jekyll_tidy:
    exclude: ["index.html"]
    compress_html: true
    ignore_env: development
```

### exclude (default: [])

`exclude` is an array of relative file paths that will be ignored by `jekyll-tidy`. Exclude must be set as an array, or it will cause errors.

```
  exclude: ["index.html"] # excludes only index.html
```

`exclude` can also take a glob of file paths. *Note:* File globs must be wrapped with `""`.

```
  exclude: ["_posts/*.md"] # excludes all markdown files directly within the posts directory.
  exclude: ["_posts/**/*.md"]  # excludes all markdown files anywhere within the _posts directory
```

### compress_html (default: false)

If `compress_html` is set to `true` then `htmlcompressor` will be used to tidy the markup. If it
is set to `false` then `htmlbeautifier` will be used to tidy the markup.

### ignore_env (default: nil)

If `ignore_env` is set to a string, we will check the `JEKYLL_ENV` environment variable and skip tidying if it matches. Setting `_config.yml` with:

```
ignore_env: development
```

And then running jekyll with:

```sh
$ JEKYLL_ENV=development jekyll serve
```

Will skip all tidying.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apsislabs/jekyll-tidy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
