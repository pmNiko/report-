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
  #relation 1:N author claims
  has_many :claims, foreign_key: "author_id"
  #relation 1:N user_1/user_2 dreports
  has_many :dreport, foreign_key: "user_1"
  has_many :dreport, foreign_key: "user_2"

  has_and_belongs_to_many :events

end
