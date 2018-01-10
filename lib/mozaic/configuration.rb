module Mozaic

    class << self
        attr_accessor :configuration
    end

    def self.configure
        self.configuration ||= Configuration.new
        yield configuration
    end

    class Configuration

        def define_component name, options = {}
            if block_given?
                Mozaic::Component.new name.to_sym, options, &Proc.new
            else
                Mozaic::Component.new name.to_sym, options
            end
        end

    end
end
