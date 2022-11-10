class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.string :date
      t.belongs_to :band
      t.belongs_to :venue
    end
  end
end
