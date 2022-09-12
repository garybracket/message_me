class RemoveEmail2 < ActiveRecord::Migration[6.1]
  def change
    remove_column :subjects, :email
  end
end
