class AddUserIdToCouplets < ActiveRecord::Migration[5.0]
  def change
    add_reference :couplets, :user, foreign_key: true
  end
end
