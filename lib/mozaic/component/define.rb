module Mozaic
    class Component
        module Define

            def component name, options = {}, &block
                Mozaic.configure.define_component name, options, capture(&block)
            end

        end
    end
end
