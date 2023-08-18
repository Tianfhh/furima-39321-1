class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|


      t.integer    :category_id     , null: false

      t.timestamps
    end
  end
end
