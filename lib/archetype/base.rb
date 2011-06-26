module Archetype
  module Base

    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods

      def register_archetype(name, &block)
        Registry.archetypes ||= {}
        Registry.archetypes[name.to_s] = block
      end

      def archetype(name)
        raise "archetypes is nil" if Registry.archetypes.nil?

        archetype = Registry.archetypes[name.to_s]
        raise "Archetype '#{name.to_s}' not found!" if archetype.nil?
        raise "No block given for archetype '#{name}'!" if archetype.class != Proc

        class_exec &archetype
      end
    end

    class Registry
     class << self
       attr_accessor :archetypes
     end
    end
    
  end
end
