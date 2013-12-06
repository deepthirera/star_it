module ActionView
  module Helpers
    class FormBuilder
      def label_with_star(method, text = nil, options = {}, &block)
        options.merge!(class: "star_it #{options[:class]}") if StarRequiredFields.needed_for(@object.class.name, method)
        label_without_star(method, text, options, &block)
      end
      alias_method_chain :label, :star
    end
  end
end
