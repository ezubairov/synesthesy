require 'hanami/interactor'
require 'telegram/bot'

module Notifications
  module ContactMe
    class Telegram
      include Hanami::Interactor

      def call(contact_name:, phone_number:, email:, comment:)
        ::Telegram::Bot::Client.run(ENV['TELEGRAM_BOT_TOKEN']) do |bot|
          bot.api.send_message(
            chat_id: ENV['TELEGRAM_CHAT_ID'],
            text: "Новая заявка: \n"\
                  "Контактное имя: #{contact_name} \n"\
                  "Телефон: #{phone_number} \n"\
                  "Электропочта: #{email}\n"\
                  "Комментарий: #{comment}")
        end
      end
    end
  end
end