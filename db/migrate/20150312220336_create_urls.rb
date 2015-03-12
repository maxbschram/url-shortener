class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :target
      t.string :shortened

      t.timestamps
    end
  end
end
