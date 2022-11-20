# frozen_string_literal: true

class AddDefaultValueToBooksName < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :quantity, :integer, default: 0
  end
end
