class Micropost < ActiveRecord::Base
  has_ancestry

  attr_accessible :content, :user_id
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  default_scope order: 'microposts.created_at DESC'

  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "rails.png"

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                                WHERE follower_id = :user_id"
                                where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
                                      user_id: user.id)
  end
end
