class AddFeebackTable < ActiveRecord::Migration
  def up
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.string :ip, :null=>false
      t.text :comment
    end
    
  end

  def down
    drop_table :feedbacks
  end
end
