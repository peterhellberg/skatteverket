# encoding: utf-8

require_relative "data"

module Skatteverket
  module PSI
    class Section
      attr_reader :text, :path

      def initialize(text, path)
        @text    = text
        @path    = path
      end

      def data
        @data ||= begin
          selector = 'ul li ul li ul li a:contains("' + text + '")'
          scraper.doc(path).at(selector).next_element.css('a').
            map.with_object({}) { |d, o|
              o[d.text] = Data.new(d.text, d.get_attribute('href'))
            }
        end
      end

      def scraper
        Skatteverket::PSI.scraper
      end
    end
  end
end
