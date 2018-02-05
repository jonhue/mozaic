require 'rails/generators'
require 'rails/generators/migration'

module Mozaic
    class LayoutGenerator < Rails::Generators::Base

        include Rails::Generators::Migration

        source_root File.join File.dirname(__FILE__), '../templates/layout'
        desc 'Generate a Mozaic layout'

        class_option :name, desc: 'Layout name', type: :string, aliases: '-n'
        class_option :extends, desc: 'Layout this layout is extending', type: :string, aliases: '-e'

        def create_files
            names = options[:name].split('/')
            name = names.pop
            template 'layout.html.erb', "app/views/layouts/#{names.join('/')}/#{name}.html.erb"
        end

    end
end
