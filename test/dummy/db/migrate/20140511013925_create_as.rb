class CreateAs < ActiveRecord::Migration
  def change
    create_table :as do |t|
      t.string :a

      t.timestamps
    end
  end
end
