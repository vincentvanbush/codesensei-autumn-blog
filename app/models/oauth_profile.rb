class OauthProfile < ApplicationRecord
  belongs_to :user

  validates :provider, :uid, presence: true
  validates :provider, uniqueness: { scope: :uid }
end
