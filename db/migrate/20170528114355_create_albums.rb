class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :release_date
      t.string :image_url
      t.references :user, foreign_key: true
      t.string :genre

      t.timestamps
    end
  end
end
