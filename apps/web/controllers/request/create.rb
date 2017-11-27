module Web::Controllers::Request
  class Create
    include Web::Action
    accept :json

    def call(params)
      self.format = :json

      @validation = ContactFormValidator.new(params[:contact_me]).validate
      if @validation.success?
        Notifications::ContactMe::Telegram.new.call(
          contact_name: params[:contact_me][:contact_name],
          phone_number: params[:contact_me][:phone_number],
          email: params[:contact_me][:email],
          comment: params[:contact_me][:comment]
        )
        status 200, 'Спасибо за обращение!</br>Я отвечу вам в ближайшее время'.to_json
      else
        status 400, @validation.errors(full: true)
                               .values
                               .flatten
                               .map{ |val| "<li>#{val}</li>" }
                               .join
                               .prepend('<ul>')
                               .concat('</ul>')
      end
    end
  end
end