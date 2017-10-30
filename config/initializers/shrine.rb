require 'shrine'
require 'shrine/storage/file_system'

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')
}

Shrine.plugin :hanami
Shrine.plugin :cached_attachment_data
Shrine.plugin :rack_file