module Mozaic

    class << self
        attr_accessor :configuration
    end

    def self.configure
        self.configuration ||= Configuration.new
        yield configuration
    end

    class Configuration

        def define_component name, options = {}, &block
            Mozaic::Component.new name, capture(&block), options
        end

    end
end
