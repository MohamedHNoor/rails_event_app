class AddFieldToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :starts_at, :datetime
    add_column :events, :description, :text
    add_column :events, :image_file_name, :string, default: "placeholder.png"
  end
end
