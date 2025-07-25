class AddDateToTweets < ActiveRecord::Migration[7.1]
  def change
    add_column :tweets, :date, :date
  end
end
