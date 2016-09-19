class CreateWebContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :web_contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :comment

      t.timestamps
    end
  end
end
