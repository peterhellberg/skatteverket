# encoding: utf-8

require 'nokogiri'
require 'open-uri'

require_relative "scraper/config"
require_relative "section"

module Skatteverket
  module PSI
    class Scraper
      attr_accessor :config

      def initialize(config = nil)
        @config = config || Scraper::Config.new
        yield(@config) if block_given?
      end

      def section_names
        sections.map(&:text)
      end

      def sections
        @sections ||= begin
          doc(config.start_path).
            at('ul li ul li a:contains("PSI-data")').
            next_element.css('a').
            map.with_object({}) do |s,o|
              o[s.text] = Section.new s.text, s.get_attribute('href')
            end
        end
      end

      def doc(path)
        Nokogiri::HTML open(url(path))
      end

      private

      def url(path)
        "#{config.base_url}/#{path.gsub(/^\//,'')}"
      end
    end
  end
end
