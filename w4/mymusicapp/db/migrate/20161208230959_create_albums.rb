class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :track_id
      t.timestamps
    end
  end
end
