module Mozaic
    module LayoutHelper

        def mozaic parent = :mozaic, area = :mozaic, &block
            extends parent.to_sym do
                replace area.to_sym do
                    capture(&block)
                end
            end
        end

        def mozaic_area name = :mozaic, &block
            if block_given?
                area name.to_sym do
                    capture(&block)
                end
            else
                area name.to_sym
            end
        end

    end
end
