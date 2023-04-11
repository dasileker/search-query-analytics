class AddUserToSearchHistories < ActiveRecord::Migration[7.0]
  def up
    add_reference :search_histories, :user, null: true, foreign_key: true

    # Add your logic to update the existing search_histories records with a valid user_id
    # For example, you can create a temporary user:
    user = User.create(email: 'temp@example.com', password: 'temporary123')
    SearchHistory.where(user_id: nil).update_all(user_id: user.id)

    change_column_null :search_histories, :user_id, false
  end

  def down
    remove_reference :search_histories, :user
  end
end
