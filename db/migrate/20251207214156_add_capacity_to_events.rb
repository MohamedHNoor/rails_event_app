class AddCapacityToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :capacity, :integer, default: 1
    add_column :events, :slug, :string
  end
end
