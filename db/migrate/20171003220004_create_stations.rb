class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.text :name
      t.integer :dock_count
      t.text :city
      t.date :installation_date

      t.timestamps null: false
    end
  end
end

# class CreateFilms < ActiveRecord::Migration
#   def change
#     create_table :films do |t|
#       t.text    :title
#       t.integer :year
#       t.integer :box_office_sales
#
#       t.timestamps null: false
#     end
#   end
# end
