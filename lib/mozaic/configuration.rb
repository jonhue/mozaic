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
            Mozaic::Component.new name.to_sym, options, &Proc.new
        end

    end
end
