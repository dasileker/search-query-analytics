class AddCountToSearchHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :search_histories, :count, :integer, default: 1
  end
end
