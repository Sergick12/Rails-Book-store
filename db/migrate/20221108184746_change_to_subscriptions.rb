class ChangeToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    change_table :subscriptions do |t|
      t.rename :books_id, :book_id
      t.rename :subscribers_id, :subscriber_id
    end
  end
end
