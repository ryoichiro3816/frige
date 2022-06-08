class WithErrorFormBuilder < ActionView::Helpers::FormBuilder
  def pick_errors(attribute)
    return nil if @object.nil? || (messages = @object.errors.messages[attribute]).nil?

    lis = messages.collect do |message|
      %{#{@object.errors.full_message(attribute, message)}}
    end.join

    %{<div class="errors_parent"><ul class="errors">#{lis}</ul></div>}.html_safe
  end

  def text_field(attribute, options={})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end

  def email_field(attribute, options={})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end

  def password_field(attribute, options={})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end

  def date_field(attribute, options={})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end

  def number_field(attribute, options={})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end

  def amount_field(attribute, options={})
    return super if options[:no_errors]
    super + pick_errors(attribute)
  end    

end