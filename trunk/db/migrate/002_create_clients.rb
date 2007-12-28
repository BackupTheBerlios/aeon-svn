class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :address_1, :address_2, :city, :province, :postal
      t.string :phone, :cell, :email
      t.boolean :email_reminder
      t.text :notes
      t.timestamps
    end

    # Add a foreign key reference to clients in the appointments table
    add_column :appointments, :client_id, :integer
  end

  def self.down
    drop_table :clients
    remove_column :appointments, :client_id
  end
end
