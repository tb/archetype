require 'archetype/base'
require 'archetype/resolver'

module Archetype
end

ActionController::Base.send :include, Archetype::Base
