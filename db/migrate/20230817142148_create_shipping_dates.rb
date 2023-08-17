class CreateShippingDates < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_dates do |t|

      t.timestamps
    end
  end
end
