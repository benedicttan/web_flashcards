class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :deck
      t.string :title, :description
      t.timestamps
    end
  end
end