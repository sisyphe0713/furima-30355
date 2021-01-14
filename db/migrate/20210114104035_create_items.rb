class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.references :user
      t.string :name
      t.integer :price
      t.text :text
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_fee_id
      t.integer :prefecture_id
      t.integer :ship_day_id
      t.timestamps
    end
  end
end
