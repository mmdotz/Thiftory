class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.belongs_to :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
