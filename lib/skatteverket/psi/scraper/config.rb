# encoding: utf-8

module Skatteverket
  module PSI
    class Scraper
      class Config
        attr_accessor :base_url, :start_path

        def initialize
          @base_url   = 'http://www.skatteverket.se'
          @start_path = '/psidata'
          yield self if block_given?
        end
      end
    end
  end
end
