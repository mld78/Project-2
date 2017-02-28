class CreateCouplets < ActiveRecord::Migration[5.0]
  def change
    create_table :couplets do |t|
      t.string :title
      t.string :first_line
      t.string :last_line

      t.timestamps
    end
  end
end
