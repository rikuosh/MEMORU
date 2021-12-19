class AddStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :status, :boolean, default: true, null: true
  end
end
