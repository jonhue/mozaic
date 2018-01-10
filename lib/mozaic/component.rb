module Mozaic
    class Component

        cattr_accessor :instances
        attr_accessor :name
        attr_accessor :block
        attr_writer :options

        def initialize name, options = {}, &block
            self.name = name.to_sym
            self.block = block if block_given?
            self.options = options
            self.class.instances = [] if @@instances.nil?
            self.class.instances << self
        end

        def options options = {}
            @options.merge! options
        end

        def render options = {}
            self.options = self.options options
            self.block.call unless self.block.nil?
        end

        def self.find_by_name name
            return [] if self.instances.nil?
            self.instances.select { |component| component.name == name.to_sym }
        end

    end
end
