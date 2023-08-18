class AddContentToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :content, :text
  end
end
