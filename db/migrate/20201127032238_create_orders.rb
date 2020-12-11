class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :postal_code,    null: false
      t.integer    :area_id,  null: false
      t.string     :municipalities, null: false
      t.string     :address,        null: false
      t.string     :building_name
      t.string     :phone_number,   null: false
      t.references :order_history, null: false,foreign_key:true

      t.timestamps
    end
  end
end
