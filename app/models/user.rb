class User < ApplicationRecord

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable

  #---------- Associations ----------#

  # => relation n:m teams_users
  has_and_belongs_to_many :teams
  # => relation n:m dreports_users
  has_and_belongs_to_many :dreports

  # => relation 1:N author claims
  has_many :claims, foreign_key: "author_id"


  # => Relation N:M users - events
  has_and_belongs_to_many :events

  # => Profile
  has_one :profile, :dependent => :destroy

  after_create :create_profile

  def create_profile
    Profile.create(user: self)
  end



end
