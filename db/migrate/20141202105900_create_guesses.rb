class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :card
      t.belongs_to :round
      t.integer :correct
      t.timestamps
    end
  end
end