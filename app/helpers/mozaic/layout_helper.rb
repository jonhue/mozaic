module Mozaic
    module LayoutHelper

        def mozaic parent = :mozaic, area = :mozaic, &block
            extends parent do
                replace area do
                    capture(&block)
                end
            end
        end

        def mozaic_area name = :mozaic, &block
            area name do
                capture(&block)
            end
        end

    end
end
