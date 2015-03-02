class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :description
      t.string :type
      t.integer :article_id

      t.timestamps
    end
  end
end
