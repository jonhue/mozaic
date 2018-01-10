module Mozaic
    class Component
        module Define

            def define_component name, options = {}
                Mozaic.configure do |config|
                    config.define_component name.to_sym, options, &Proc.new
                end
            end

        end
    end
end
