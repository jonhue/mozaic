# frozen_string_literal: true

require 'rails/generators'
require 'rails/generators/migration'

module Mozaic
  class ComponentGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), '../templates/component'
    desc 'Generate a Mozaic component'

    class_option :name, desc: 'Component name', type: :string, aliases: '-n'

    def create_files
      names = options[:name].split('/')
      name = names.pop
      create_view(name, names.join('/'))
      create_javascript(options[:name])
      create_stylesheet(options[:name])
    end

    private

    def create_view(name, path)
      template 'partial.html.erb',
               "app/views/mozaic/#{path}/_#{name}.html.erb"
    end

    def create_javascript(path)
      template 'asset.js.erb',
               "#{Mozaic.configuration.javascripts}/mozaic/#{path}.js"
    end

    def create_stylesheet(path)
      template 'asset.css.erb',
               "#{Mozaic.configuration.stylesheets}/mozaic/#{path}.css"
    end
  end
end
