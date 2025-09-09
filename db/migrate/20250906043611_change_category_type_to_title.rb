class ChangeCategoryTypeToTitle < ActiveRecord::Migration[8.0]
  def change
    rename_column :categories, :type, :title
  end
end
