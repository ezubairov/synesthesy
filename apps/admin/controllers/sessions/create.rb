module Admin::Controllers::Sessions
  class Create
    include Admin::Action

    def call(_)
      user = UserRepository.new.find_by_email(params[:session][:email])

      if !user.nil? && password_correct?(user)
        session[:user_id] = user.id
        redirect_to routes.root_path
      else
        redirect_to routes.new_session_path
      end
    end

    private

    def password_correct?(user)
      BCrypt::Password.new(user.password) == params[:session][:password_plain]
    end

    def authenticate!; end
  end
end