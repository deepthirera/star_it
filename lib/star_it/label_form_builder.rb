require 'action_view/helpers'

module StarIt
  class LabelFormBuilder < ActionView::Helpers::FormBuilder
    def label(method, text = nil, options = {}, &block)
      options.merge!(class: "star_it #{options[:class]}") if StarRequiredFields.needed_for(@object.class.name, method)
      super(method, text, options, &block)
    end
  end
end
