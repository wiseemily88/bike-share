class AddPrimaryKeyToTables < ActiveRecord::Migration[5.1]
  def change
    change_table :stations do |t|
     t.rename :id, :station_name_id
   end

   change_table :trips do |t|
    t.rename :id, :trip_name_id
    end
  end
end
