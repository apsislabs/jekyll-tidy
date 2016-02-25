require "jekyll"
require "htmlbeautifier"

module Jekyll
    module Tidy
        def self.output_clean(output)
            return HtmlBeautifier.beautify(output)
        end
    end
end

Jekyll::Hooks.register :posts, :post_render do |post|
    post.output = Jekyll::Tidy::output_clean(post.output)
end

Jekyll::Hooks.register :pages, :post_render do |page|
    page.output = Jekyll::Tidy::output_clean(page.output)
end
