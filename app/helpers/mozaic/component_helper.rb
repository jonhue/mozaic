# frozen_string_literal: true

module Mozaic
  module ComponentHelper
    def component(name, options = {}, &block)
      component = Mozaic::Component.find_by_name(name.to_sym).first
      rendered = component.render(options)
      return if rendered == false

      render partial: "mozaic/#{name}",
             locals: {
               options: component.options(rendered.nil? ? options : rendered),
               block: block_given? ? capture(&block) : nil
             }
    end

    def component_wrapper(name, options = {}, &block)
      content_tag class: "mozaic--component #{name.to_s.split('/').join(' ')} "\
                         "#{options[:class]}",
                  id: options[:id] { capture(&block) }
    end
  end
end
