module Web::Views::Home
  class Index
    include Web::View

    def form
      form_for :contact_me, routes.request_path do
        div class: 'row' do
          div class: 'input-field col s6'  do
            label 'Телефон', for: :phone_number
            text_field :phone_number
          end
          div class: 'input-field col s6'  do
            label 'Электронная почта', for: :email
            text_field :email
          end
        end
        div class: 'row' do
          div class: 'input-field col s12' do
            label 'Контактное имя', for: :contact_name
            text_field :contact_name
          end
        end
        div class: 'row' do
          div class: 'input-field col s12' do
            label 'Ваш вопрос или комментарий', for: :comment
            text_area :comment, class: 'materialize-textarea'
          end
        end

        div class: 'row col s12' do
          submit 'Отправить', class: 'btn btn-primary waves-effect waves-light'
        end

      end
    end
  end
end