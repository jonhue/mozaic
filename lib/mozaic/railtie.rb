# frozen_string_literal: true

require 'rails/railtie'
require 'active_support'

module Mozaic
  class Railtie < Rails::Railtie
    initializer 'mozaic.initialize' do
      ActiveSupport.on_load :active_record do
        include Mozaic::Component::Define
      end
    end
  end
end
