# encoding: utf-8

require_relative "psi/scraper"

module Skatteverket
  module PSI
    class << self
      def scraper(config = nil)
        @scraper ||= Scraper.new(config).tap do |s|
          yield(s.config) if block_given?
        end
      end

      def section_names
        scraper.sections.keys
      end

      def section
        scraper.sections
      end
    end
  end
end
