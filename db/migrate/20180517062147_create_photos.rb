class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :filename
      t.string :content_type
      t.integer :claim_id

      t.binary :content

      t.timestamps
    end
  end
end
