class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :albums, dependent: :destroy
  has_one :profile

  def has_profile?
    profile.present? && profile.persisted?
  end
end
