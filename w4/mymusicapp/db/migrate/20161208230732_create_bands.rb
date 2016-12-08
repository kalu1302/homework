class CreateBands < ActiveRecord::Migration[5.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.integer :album_id
      t.timestamps
    end
  end
end
