class Track < ApplicationRecord

  belongs_to :album,
  class_name: :Album,
  primary_key: :id,
  foreign_key: :track_id,
end
