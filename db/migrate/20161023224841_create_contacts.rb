class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :company, index: true, foreign_key: true
      t.string :full_name
      t.string :position
      t.string :email
    end
  end
end
