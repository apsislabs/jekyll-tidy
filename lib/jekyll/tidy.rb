require "jekyll"
require "htmlbeautifier"
require "sanitize"

module Jekyll
    module Tidy
        def output_clean(output)
            output = Sanitize.document(post.output, ::Sanitize::Config::RELAXED)
            return HtmlBeautifier.beautify(output)
        end

        Jekyll::Hooks.register :posts, :post_render do |post|
            post.output = Jekyll::Tidy::output_clean(post.output)
        end

        Jekyll::Hooks.register :pages, :post_render do |page|
            page.output = Jekyll::Tidy::output_clean(page.output)
        end
    end
end
