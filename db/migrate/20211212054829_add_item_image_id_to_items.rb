# frozen_string_literal: true

class AddItemImageIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_image_id, :string
  end
end
