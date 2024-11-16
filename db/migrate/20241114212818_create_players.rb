class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :skill_level
      t.references :team, null: true , foreign_key: true

      t.timestamps
    end
  end
end
