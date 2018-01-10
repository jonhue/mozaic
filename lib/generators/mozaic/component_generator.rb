require 'rails/generators'
require 'rails/generators/migration'

module Mozaic
    class ComponentGenerator < Rails::Generators::Base

        include Rails::Generators::Migration

        source_root File.join File.dirname(__FILE__), 'templates/component'
        desc 'Generate a Mozaic component'

        class_option :name, desc: 'Component name', type: :string, aliases: '-n'

        def create_files
            names = options[:name].split('/')
            name = names.pop
            template 'partial.html.erb', "app/views/mozaic/#{names.join('/')}/_#{name}.html.erb"
        end

    end
end
