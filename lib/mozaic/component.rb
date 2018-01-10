module Mozaic
    class Component

        cattr_accessor :instances
        attr_accessor :name
        attr_accessor :code
        attr_writer :options

        def initialize name, code = nil, options = {}
            @name = name
            @code = code
            @options = options
            @@instances = [] if @@instances.nil?
            @@instances << self
        end

        def options options = {}
            @options.merge! options
        end

        def render options = {}
            options = self.options options
            eval(self.code)
        end

        def self.find_by_name name
            self.instances.select { |component| component.name == name }
        end

    end
end
