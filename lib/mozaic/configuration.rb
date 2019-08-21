# frozen_string_literal: true

module Mozaic
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  class Configuration
    attr_accessor :es6
    attr_accessor :javascripts
    attr_accessor :stylesheets

    def initialize
      @es6 = true
      @javascripts = 'app/javascript/javascripts'
      @stylesheets = 'app/javascript/stylesheets'
    end

    def define_component(name, options = {})
      if block_given?
        Mozaic::Component.new name.to_sym, options, &Proc.new
      else
        Mozaic::Component.new name.to_sym, options
      end
    end
  end
end
