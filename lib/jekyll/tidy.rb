require "jekyll/tidy/version"

require "jekyll"
require "htmlbeautifier"
require "htmlcompressor"

module Jekyll
  module Tidy
    def self.init(site)
      @JEKYLL_CONFIG = site.config
    end

    def self.jekyll_config
      @JEKYLL_CONFIG || Jekyll.configuration({})
    end

    def self.exclude?(path, override = {})
      config = jekyll_config.merge(override)
      exclude_paths = config["jekyll_tidy"] && config["jekyll_tidy"]["exclude"]
      exclude_paths.to_a.any? { |exclude| File.fnmatch(exclude, path) }
    end

    def self.compress_output?
      jekyll_config["jekyll_tidy"] && jekyll_config["jekyll_tidy"]["compress_html"]
    end

    def self.output_clean(output, compress = false)
      if compress
        return HtmlCompressor::Compressor.new.compress output
      else
        return HtmlBeautifier.beautify output
      end
    end

    def self.ignore_env?
      Jekyll.env == (jekyll_config["jekyll_tidy"] && jekyll_config["jekyll_tidy"]["ignore_env"])
    end
  end
end

# Jekyll Hooks
# -------------------------------------

Jekyll::Hooks.register :site, :after_reset do |jekyll|
  Jekyll::Tidy.init(jekyll)
end

Jekyll::Hooks.register :documents, :post_render do |doc|
  next if Jekyll::Tidy.ignore_env?
  unless Jekyll::Tidy::exclude?(doc.relative_path)
    doc.output = Jekyll::Tidy::output_clean(doc.output, Jekyll::Tidy.compress_output?)
  end
end

Jekyll::Hooks.register :pages, :post_render do |page|
  next if Jekyll::Tidy.ignore_env?
  unless Jekyll::Tidy::exclude?(page.relative_path)
    page.output = Jekyll::Tidy::output_clean(page.output, Jekyll::Tidy.compress_output?)
  end
end
