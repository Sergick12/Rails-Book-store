class ChangeToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    change_column :subscriptions do |t|
      t.is_active
    end
    change_column_default :subscriptions, :is_active, false
    
  end
end
