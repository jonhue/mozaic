module Mozaic
    module ComponentHelper

        def component name, options = {}, &block
            c = Mozaic::Component.find_by_name(name.to_sym).first
            c.render options
            render partial: "mozaic/#{name}", locals: { options: c.options(options), block: ( block_given? ? capture(&block) : nil ) }
        end

        def component_wrapper name, options = {}, &block
            content_tag class: "#{name.to_s.split('/').join(' ')} #{options[:class]}", id: options[:id] do
                capture(&block)
            end
        end

    end
end
