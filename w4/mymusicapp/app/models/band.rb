class Band < ApplicationRecord

  has_many :albums,
  class_name: :Album,
  primary_key: :id,
  foreign_key: :album_id,
  dependent: :destroy
end
