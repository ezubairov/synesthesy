require 'telegram/bot'
module Web::Controllers::Request
  class Create
    include Web::Action

    def call(params)
      Telegram::Bot::Client.run(ENV['TELEGRAM_BOT_TOKEN']) do |bot|
        bot.api.send_message(
            chat_id: ENV['TELEGRAM_CHAT_ID'],
            text: "Новая заявка: \n"\
                  "Контактное имя: #{params[:contact_me][:contact_name]} \n"\
                  "Телефон: #{params[:contact_me][:phone_number]} \n"\
                  "Электропочта: #{params[:contact_me][:email]}\n"\
                  "Комментарий: #{params[:contact_me][:comment]}")
      end
      redirect_to routes.root_path
    end
  end
end