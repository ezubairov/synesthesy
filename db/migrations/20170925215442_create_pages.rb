Hanami::Model.migration do
  change do
    create_table :pages do
      primary_key :id

      column :slug,  String, null: false
      column :title, String, null: false
      column :body,  String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
