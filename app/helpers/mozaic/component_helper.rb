module Mozaic
    module ComponentHelper

        def component name, options = {}
            c = Mozaic::Component.find_by_name name
            c.render options
            render partial: "mozaic/#{name}", locals: { options: c.options options }
        end

    end
end
