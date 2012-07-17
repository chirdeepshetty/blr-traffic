class AddVideosAndOffencesTables < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.string :name, :null=>false
      t.string :youtube_link, :null=>false
    end
    
    create_table :offences do |t|
      t.string :ip, :null=>false
      t.references :videos, :null=>false
      t.integer :time
    end
  end

  def down
    drop_table :offences
    drop_table :videos
  end
end
