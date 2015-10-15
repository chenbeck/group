class CreateMygroups < ActiveRecord::Migration
  def change
    create_table :mygroups do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
