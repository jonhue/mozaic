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
            template 'partial.html.erb', "app/views/mozaic/#{names.join('/')}/_#{name}.html.erb"
            template 'asset.js.erb', "#{Mozaic.configuration.javascripts}/mozaic/#{options[:name]}.js"
            template 'asset.css.erb', "#{Mozaic.configuration.stylesheets}/mozaic/#{options[:name]}.css"
        end

    end
end
