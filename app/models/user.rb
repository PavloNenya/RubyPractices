class User < ApplicationRecord
  has_one :profile
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
  ROLES = ["provider", "client"]
  validates :role, inclusion: { in: ROLES }

  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end

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

end
