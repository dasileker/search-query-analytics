class RemoveNullUserIdFromSearchHistories < ActiveRecord::Migration[7.0]
  def up
    SearchHistory.where(user_id: nil).delete_all
  end

  def down
    # No need to do anything in the down method.
  end
end

# class RemoveNullUserIdFromSearchHistories < ActiveRecord::Migration[6.1]
#   def up
#     SearchHistory.where(user_id: nil).delete_all
#   end

#   def down
#     # No need to do anything in the down method.
#   end
# end
