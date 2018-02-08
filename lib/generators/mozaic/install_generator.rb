require 'rails/generators'
require 'rails/generators/migration'

module Mozaic
    class InstallGenerator < Rails::Generators::Base

        include Rails::Generators::Migration

        source_root File.join File.dirname(__FILE__), '../templates/install'
        desc 'Install Mozaic'

        def create_initializer
            template 'initializer.rb', 'config/initializers/mozaic.rb'
        end

        def create_layout
            template 'layout.html.erb', 'app/views/layouts/mozaic.html.erb'
        end

    end
end
