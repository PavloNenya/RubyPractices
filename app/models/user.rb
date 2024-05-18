class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :posters
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy # Add this line
  has_many :payments
  has_many :chose_us
  has_many :chose_ps
  has_many :votes
  ROLES = ["provider", "client"]
  validates :role, inclusion: { in: ROLES }


  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= "client"
  end

  validate :karazin_email_for_provider

  private

  def karazin_email_for_provider
    if role == "provider" && email !~ /@karazin.ua\z/
      errors.add(:email, "must end with @karazin.ua for providers")
    end
  end
  scope :with_role, ->(role_name) { where(role: role_name) }
end
