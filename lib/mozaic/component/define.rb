module Mozaic
    class Component
        module Define

            def define_component name, options = {}, &block
                Mozaic.configure do |config|
                    config.define_component name.to_sym, options, ( block_given? ? capture(&block) : nil )
                end
            end

        end
    end
end
