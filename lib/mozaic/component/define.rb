module Mozaic
    class Component
        module Define

            def define_component name, options = {}
                Mozaic.configure do |config|
                    if block_given?
                        config.define_component name.to_sym, options, &Proc.new
                    else
                        config.define_component name.to_sym, options
                    end
                end
            end

        end
    end
end
