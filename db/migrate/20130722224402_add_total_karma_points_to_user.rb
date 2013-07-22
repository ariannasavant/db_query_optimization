class AddTotalKarmaPointsToUser < ActiveRecord::Migration
  def change
    User.find_each do |user|
      puts user.id
      user.update_attribute(:total_karma, user.karma_points.sum(:value))
    end
  end
end
