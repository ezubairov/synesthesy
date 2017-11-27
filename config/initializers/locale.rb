require 'i18n'

I18n.load_path = Dir[Hanami.root.join('config/locales/**/*.yml')]
I18n.available_locales = :ru
I18n.default_locale = :ru
I18n.backend.load_translations