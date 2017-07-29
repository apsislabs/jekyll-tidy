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

      def jekyll_tidy_config
        @jekyll_config["jekyll_tidy"] || {}
      end

      def exclude?(file_path)
        jekyll_tidy_config["exclude"].to_a.any? do |exclude_path|
          File.fnmatch? exclude_path, file_path, File::FNM_PATHNAME
        end
      end

      def compress_output?
        jekyll_tidy_config["compress_html"] == true
      end

      def output_clean(output)
        if compress_output?
          return HtmlCompressor::Compressor.new.compress output
        else
          return HtmlBeautifier.beautify output
        end
      end

      def ignore_env?
        Jekyll.env == jekyll_tidy_config["ignore_env"]
      end

      def up(path, output)
        return output if ignore_env?
        output_clean(output) unless exclude?(path)
      end
    end
  end

  # Jekyll Hooks
  # -------------------------------------

  Hooks.register :site, :after_init do |site|
    Tidy.init(site.config)
  end

  Hooks.register :documents, :post_render do |doc|
    doc.output = Tidy.up(doc.relative_path, doc.output)
  end

  Hooks.register :pages, :post_render do |page|
    page.output = Tidy.up(page.relative_path, page.output)
  end
end
