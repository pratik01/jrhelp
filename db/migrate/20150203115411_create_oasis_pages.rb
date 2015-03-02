class CreateOasisPages < ActiveRecord::Migration
  def change
    create_table :oasis_pages do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
