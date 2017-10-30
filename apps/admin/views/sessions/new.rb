module Admin::Views::Sessions
  class New
    include Admin::View

    def form
      form_for :session, routes.sessions_path do
        div do
          label :email
          text_field :email
        end
        div do
          label :password
          password_field :password_plain
        end
        submit 'Sign in'
      end
    end
  end
end