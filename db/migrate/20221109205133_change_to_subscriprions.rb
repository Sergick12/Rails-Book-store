class ChangeToSubscriprions < ActiveRecord::Migration[7.0]
  def change
    change_table :subscriptions do |t|
      t.remove :delete_at
      t.datetime :start, :finish
    end
  end
end
