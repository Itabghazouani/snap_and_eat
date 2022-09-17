class AddColumnToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :details, :string
  end
end
