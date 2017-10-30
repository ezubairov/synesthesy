require 'telegram/bot'
module Web::Controllers::Request
  class Create
    include Web::Action

    def call(params)
      Telegram::Bot::Client.run(ENV['TELEGRAM_BOT_TOKEN']) do |bot|
        bot.api.send_message(
            chat_id: ENV['TELEGRAM_CHAT_ID'],
            text: "Новая заявка: Контактное имя: #{params[:contact_me][:contact_name]} \nТелефон: #{params[:contact_me][:phone_number]} \nЭлектропочта: #{params[:contact_me][:email]}")
      end
      redirect_to routes.root_path
    end
  end
end