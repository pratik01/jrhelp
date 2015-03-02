class CreateOases < ActiveRecord::Migration
  def change
    create_table :oases do |t|
      t.string :page_id
      t.text :description

      t.timestamps
    end
  end
end
