# encoding: utf-8

module Skatteverket
  module PSI
    class Data
      attr_reader :text, :path, :info

      def initialize(text, path)
        @text = text
        @path = path
      end

      def scrape!
        @info ||= begin
          doc = scraper.doc(path)

          hash = {}
          hash[:download_url] = doc.at('div.pagecontent #Nedladdning').
                                  next_element.css('p a')
          hash
        end
      end

      def scraper
        Skatteverket::PSI.scraper
      end
    end
  end
end
