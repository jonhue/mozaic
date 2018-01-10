module Mozaic
    module ComponentHelper

        def component name, options = {}
            c = Mozaic::Component.find_by_name name
            c.render options
            render partial: "mozaic/#{name}", locals: { options: c.options options }
        end

        def component_wrapper name, options = {}, &block
            content_tag class: "#{name.split('/').join(' ')} #{options[:class]}", id: options[:id] do
                capture(&block)
            end
        end

    end
end
