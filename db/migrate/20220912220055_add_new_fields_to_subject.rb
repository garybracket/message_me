class AddNewFieldsToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :sex, :string
    add_column :subjects, :geneticresult, :string
    add_column :subjects, :location, :string
    add_column :subjects, :nearestsite, :string
    add_column :subjects, :personalmutation, :string
    add_column :subjects, :familymutation, :string
    add_column :subjects, :condition, :string
    add_column :subjects, :pedigree, :string
  end
end
