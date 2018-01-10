module Mozaic
    class Component

        cattr_accessor :instances
        attr_accessor :name
        attr_accessor :code
        attr_writer :options

        def initialize name, code = nil, options = {}
            self.name = name.to_sym
            self.code = code
            self.options = options
            self.class.instances = [] if @@instances.nil?
            self.class.instances << self
        end

        def options options = {}
            @options.merge! options
        end

        def render options = {}
            options = self.options options
            eval(self.code) unless self.code.nil?
        end

        def self.find_by_name name
            return [] if self.instances.nil?
            self.instances.select { |component| component.name == name.to_sym }
        end

    end
end
