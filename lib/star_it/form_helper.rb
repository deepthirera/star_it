require 'star_it/label_form_builder'

module StarIt
  module FormHelper
    def simple_form_for(record_or_name_or_array, *args, &proc)
      options = args.extract_options!
      record_or_name_or_array.reject! {|a| a.nil? } if record_or_name_or_array.is_a? Array
      form_for(record_or_name_or_array, *(args << options.merge(:builder => StarIt::LabelFormBuilder)), &proc)
    end

    def simple_fields_for(record_or_name_or_array, *args, &proc)
      options = args.extract_options!
      fields_for(record_or_name_or_array, *(args << options.merge(:builder => StarIt::LabelFormBuilder)), &proc)
    end
  end
end
