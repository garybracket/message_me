class AddAgeToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :age, :string
  end
end
