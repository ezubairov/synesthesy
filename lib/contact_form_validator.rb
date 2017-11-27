require 'dry/validation/messages/i18n'

class ContactFormValidator
  include Hanami::Validations::Form

  messages :i18n

  validations do
    required(:contact_name).filled
    optional(:phone_number).maybe(:str?)
    optional(:email).maybe(:str?)
    required(:comment).filled

    rule(phone_number_or_email: [:phone_number, :email]) do |phone_number, email|
      phone_number.filled? | email.filled?
    end
  end
end