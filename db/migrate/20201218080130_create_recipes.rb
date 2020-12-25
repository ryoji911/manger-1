class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :menu_name, null: false
      t.text   :material,  null: false
      t.text   :process,   null: false
      t.text   :point,     null: false
      t.string :time,      null: false
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
