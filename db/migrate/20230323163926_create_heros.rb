class CreateHeros < ActiveRecord::Migration[7.0]
  def change
    create_table :heros do |t|
      t.string :name, null: false
      t.string :super_name, null: false

      t.timestamps
    end
  end
end
