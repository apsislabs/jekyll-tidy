require "jekyll/tidy/version"

require "jekyll"
require "htmlbeautifier"
require "htmlcompressor"

module Jekyll
  module Tidy
    class << self
      def init(config)
        @jekyll_config = config
      end

      def jekyll_config
        @jekyll_config || Jekyll.configuration({})
      end

      def exclude?(path, override = {})
        config = jekyll_config.merge(override)
        exclude_paths = config["jekyll_tidy"] && config["jekyll_tidy"]["exclude"]
        exclude_paths.to_a.any? { |exclude| File.fnmatch(exclude, path) }
      end

      def compress_output?
        jekyll_config["jekyll_tidy"] && jekyll_config["jekyll_tidy"]["compress_html"]
      end

      def output_clean(output, compress = false)
        if compress
          return HtmlCompressor::Compressor.new.compress output
        else
          return HtmlBeautifier.beautify output
        end
      end

      def ignore_env?
        Jekyll.env == (
          jekyll_config["jekyll_tidy"] && jekyll_config["jekyll_tidy"]["ignore_env"]
        )
      end
    end
  end

  # Jekyll Hooks
  # -------------------------------------

  Hooks.register :site, :after_init do |site|
    Tidy.init(site.config)
  end

  Hooks.register :documents, :post_render do |doc|
    next if Tidy.ignore_env?
    unless Tidy.exclude?(doc.relative_path)
      doc.output = Tidy.output_clean(doc.output, Tidy.compress_output?)
    end
  end

  Hooks.register :pages, :post_render do |page|
    next if Tidy.ignore_env?
    unless Tidy.exclude?(page.relative_path)
      page.output = Tidy.output_clean(page.output, Tidy.compress_output?)
    end
  end
end
