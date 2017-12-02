Hanami::Model.migration do
  change do
    create_table :prices do
      primary_key :id
      column :title, String, null: false
      column :price, Integer, null: false
      column :additional, TrueClass, null: false, default: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
