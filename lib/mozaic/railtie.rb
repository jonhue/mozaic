require 'rails/railtie'
require 'active_support'

module Mozaic
    class Railtie < Rails::Railtie

        initializer 'mozaic.initialize' do
            ActiveSupport.on_load :active_record do
                include Mozaic::Component::Define
            end
        end

        config.after_initialize do
            Mozaic::Component.instances.each do |component|
                Rails.application.config.assets.precompile += ["mozaic/#{component.name.to_s}.js", "mozaic/#{component.name.to_s}.css"]
            end
        end

    end
end
