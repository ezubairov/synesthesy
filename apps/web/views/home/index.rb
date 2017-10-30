module Web::Views::Home
  class Index
    include Web::View

    def form
      form_for :contact_me, routes.request_path, class: 'mb-3' do
        div class: 'form-group' do
          label 'Контактное имя', for: :contact_name
          text_field :contact_name, class: 'form-control'
        end
        div class: 'form-group' do
          label 'Телефон', for: :phone_number
          text_field :phone_number, class: 'form-control'
        end
        div class: 'form-group' do
          label 'Электропочта', for: :email
          text_field :email, class: 'form-control'
        end
        div class: 'text-center' do
          submit 'Отправить', class: 'btn btn-primary'
        end
      end
    end
  end
end