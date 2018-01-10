require 'mozaic/version'

module Mozaic

    require 'mozaic/configuration'

    autoload :Component, 'mozaic/component'
    autoload :Define, 'mozaic/component/define'

    require 'mozaic/engine'
    require 'mozaic/railtie'

end
