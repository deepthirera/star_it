class StarRequiredFields
  # User.validators.select do |v|
  #   v.is_a?(ActiveRecord::Validations::PresenceValidator)
  # end

  # ActiveRecord::Base.connection.tables.map{|x|x.classify.safe_constantize}

  def self.needed_for(model_name, field_name)
    presence_validator = model_name.constantize.validators.select do |validator_instance|
      validator_instance.is_a?(ActiveRecord::Validations::PresenceValidator)
    end

    presence_validator.first.attributes.include?(field_name.to_sym)
  end
end
