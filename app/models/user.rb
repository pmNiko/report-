class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable
  #relation n:m claims_users
  #has_and_belongs_to_many :claims
  #relation n:m teams_users
  has_and_belongs_to_many :teams
end
