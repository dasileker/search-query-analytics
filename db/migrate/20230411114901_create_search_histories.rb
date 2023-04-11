class CreateSearchHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :search_histories do |t|
      t.string :query

      t.timestamps
    end
  end
end
