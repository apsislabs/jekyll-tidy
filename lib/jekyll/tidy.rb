require "jekyll"
require "htmlbeautifier"
require "htmlcompressor"

JEKYLL_CONFIG = Jekyll.configuration({})

module Jekyll
    module Tidy
        def self.exclude?(path)
            res = false
            exclude = JEKYLL_CONFIG['jekyll_tidy'] && JEKYLL_CONFIG['jekyll_tidy']['exclude']

            if exclude
                res = exclude.to_a.include? path
            end

            return res
        end

        def self.compress_html?
            JEKYLL_CONFIG['jekyll_tidy'] && JEKYLL_CONFIG['jekyll_tidy']['compress_html']
        end

        def self.output_clean(output)
            if compress_html?
                compressor = HtmlCompressor::Compressor.new
                return compressor.compress output
            else
                return HtmlBeautifier.beautify output
            end
        end
    end
end

Jekyll::Hooks.register :posts, :post_render do |post|
    unless Jekyll::Tidy::exclude?(post.path)
        post.output = Jekyll::Tidy::output_clean(post.output)
    end
end

Jekyll::Hooks.register :pages, :post_render do |page|
    unless Jekyll::Tidy::exclude?(page.path)
        page.output = Jekyll::Tidy::output_clean(page.output)
    end
end
