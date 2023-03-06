class UserRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :followed_user, class_name: "User"

  # Add any additional methods for managing relationships here
end
