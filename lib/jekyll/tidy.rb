require "jekyll/tidy/version"
require "nokogiri"

module Jekyll
    module Tidy
        def output_tidied(dest, content)
            tidied = Nokogiri::HTML(content).to_xhtml(indent: 4)
            write_file(dest, tidied)
        end

        def write_file(dest, content)
            FileUtils.mkdir_p(File.dirname(dest))
            File.open(dest, 'w') do |f|
                f.write(content)
            end
        end
    end

    class Post
        include Tidy

        def write(dest)
            puts "Tomato"
            dest_path = destination(dest)
            output_tidied(dest_path, output)
        end
    end

    class Page
        include Tidy

        def write(dest)
            dest_path = destination(dest)
            output_tidied(dest_path, output)
        end
    end
end
