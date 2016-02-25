# Jekyll::Tidy

`jekyll-tidy` is a plugin for tidying the HTML output of your Jekyll website, using either `htmlbeautifier` or `htmlcompressor`.

## Usage

Usage is straightforward. Simply include the gem in your `Gemfile` with:

```
    gem 'jekyll-tidy'
```

And then include the plugin in a file located in your `_plugins` directory. You can also include the plugin using the `gems` option in your `_config.yml` file, like so:

```
    gems: [jekyll-tidy]
```

## Configuration

`jekyll-tidy` takes two configuration settings, an array of files to exclude, and a flag for whether or not to compress the HTML output.

```
    jekyll_tidy:
        exclude: [index.html]
        compress_html: true
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jekyll-tidy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
