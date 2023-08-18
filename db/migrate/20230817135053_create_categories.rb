class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      
      t.integer    :genre_id     , null: false
      t.timestamps
    end
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
