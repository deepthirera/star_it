class StarRequiredFields
  def self.needed_for(model_name, field_name)
    return false unless model_name.constantize.respond_to?(:table_name)

    presence_validator = model_name.constantize.validators.select do |validator_instance|
      validator_instance.is_a?(ActiveRecord::Validations::PresenceValidator)
    end

    presence_validator.collect{|validator| validator.attributes}.flatten.include?(field_name.to_sym)
  end
end
