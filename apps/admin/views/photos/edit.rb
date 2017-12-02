module Admin::Views::Photos
  class Edit
    include Admin::View

    def form
      form_for :photo, routes.photo_path(photo.id), enctype: 'multipart/form-data', values: {photo: photo}, method: :patch do
        div class: 'row' do
          div class: 'input-field col s12' do
            label 'Название', for: :name
            text_field :name
          end
        end
        div class: 'row' do
          div class: 'input-field col s12' do
            label 'Комментарий', for: :comment
            text_field :comment
          end
        end
        div class: 'row' do
          div class: 'col s12' do
            check_box :favorite
            label :favorite
          end
        end
        div class: 'row' do
          div class: 'file-field input-field col s12' do
            div class: 'btn' do
              raw('<span>Фото</span><input type="file" name="photo[image]" id="photo-image">')
            end
            div class: 'file-path-wrapper' do
              raw('<input class="file-path validate" type="text" placeholder="Upload one or more files">')
            end
          end
        end

        submit 'Сохранить', class: 'btn btn-primary waves-effect waves-light'
      end
    end
  end
end
