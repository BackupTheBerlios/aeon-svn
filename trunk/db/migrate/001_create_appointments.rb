class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.column :occurs_on, :date
      t.column :starts_at, :time
      t.column :duration, :integer, {:default => 15, :limit => 4}
      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
