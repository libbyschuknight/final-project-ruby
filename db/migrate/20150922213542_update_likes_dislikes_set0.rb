class UpdateLikesDislikesSet0 < ActiveRecord::Migration
  def change
    change_column_default :meals, :likes, 0
    change_column_default :meals, :dislikes, 0
  end
end
