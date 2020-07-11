class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /\A([^@\s]+[A-Z0-9._a-z\-]+)@getmainstreet\.com\z/i

    record.errors[attribute] << (options[:message] || 'is not an email with @getmainstreet.com domain.')
  end
end
