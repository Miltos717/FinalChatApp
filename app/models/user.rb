class User < ApplicationRecord
  followability

  validates :username,presence: true,length: {minimum: 3,maximum: 15},uniqueness: {case_sensitive: false}
  has_secure_password
  has_many :messages
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: {case_sensitive: false},
            length: {minimum: 5,maximum: 25},format: {with: VALID_EMAIL_REGEX}

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end


  def pending_follow_request_for?(user)
    active_relationships.find_by(followed_id: user.id, status: "pending").present?
  end

  def following_users
    # Get the ids of the users that this user is following
    following_user_ids = self.following.pluck(:followable_id)
    # Get the users that correspond to the above ids
    User.where(id: following_user_ids)
  end



end
