# Jekyll::Tidy

`jekyll-tidy` is a plugin for tidying the HTML output of your Jekyll website, using either `htmlbeautifier` or `htmlcompressor`.

## Usage

Usage is straightforward. Simply include the gem in your `Gemfile` with:

```ruby
  gem 'jekyll-tidy'
```

And then include the plugin in a file located in your `_plugins` directory. You can also include the plugin using the `gems` option in your `_config.yml` file, like so:

```
  gems: [jekyll-tidy]
```

**Note**: if you set the `compress_html` option to `true` and your templates have inline CSS or javascript, it will not be minified.

## Configuration

`jekyll-tidy` takes two configuration settings, an array of files to exclude, and a flag for whether or not to compress the HTML output.

```
  jekyll_tidy:
    exclude: ["index.html"]
    compress_html: true
```

### exclude (default: [])

`exclude` is an array of relative file paths that will be ignored by `jekyll-tidy`.

```
  exclude: [index.html] # excludes only index.html
```

`exclude` can also take a glob of file paths. The following, for example, will exclude all `.md` files in the `_posts` directory, but will run `jekyll-tidy` on all other files in `_posts`.

```
  exclude: [_posts/*.md]
```

### compress_html (default: false)

If `compress_html` is set to `true` then `htmlcompressor` will be used to tidy the markup. If it
is set to `false` then `htmlbeautifier` will be used to tidy the markup.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/apsislabs/jekyll-tidy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
