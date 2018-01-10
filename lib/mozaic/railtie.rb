require 'rails/railtie'

module Mozaic
    class Railtie < Rails::Railtie

        initializer 'mozaic.initialize' do
            ActiveSupport.on_load :action_controller do
                include Mozaic::Component::Define
            end
            ActiveSupport.on_load :active_record do
                include Mozaic::Component::Define
            end
        end

    end
end
