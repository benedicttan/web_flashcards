class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.timestamps
    end
  end
end