module Web::Views::Home
  class Index
    include Web::View

    def form
      form_for :contact_me, routes.request_path, class: 'mb-3' do
        div class: 'form-group' do
          label 'Контактное имя:', for: :contact_name
          text_field :contact_name, class: 'form-control'
        end
        div class: 'form-group' do
          label 'Телефон:', for: :phone_number
          text_field :phone_number, class: 'form-control'
        end
        div class: 'form-group' do
          label 'Электронная почта:', for: :email
          text_field :email, class: 'form-control'
        end
        div class: 'form-group' do
          label 'Ваш вопрос или комментарий:'
          text_field :comment, class: 'form-control'
        end
        p { raw('Также вы можете написать мне напрямую в <a href="https://vk.com/orange_yeti" target="_blank">VK</a> или <a href="https://www.instagram.com/girl_near_you/" target="_blank">Direct</a>') }
        div class: 'text-center' do
          submit 'Отправить', class: 'btn btn-primary'
        end

      end
    end
  end
end