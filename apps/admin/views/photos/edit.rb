module Admin::Views::Photos
  class Edit
    include Admin::View

    def form
      form_for :photo, routes.photos_path, enctype: 'multipart/form-data' do
        div do
          label :name
          text_field :name
        end
        div do
          label :comment
          text_field :comment
        end
        div do
          label :favorite
          check_box :favorite
        end
        div do
          label :image
          hidden_field :image
          file_field :image
        end

        submit 'Сохранить'
      end
    end
  end
end
