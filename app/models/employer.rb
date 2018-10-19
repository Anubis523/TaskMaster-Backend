class Employer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :jwt_authenticatable, 
         jwt_revocation_strategy: JWTBlacklist

  has_many :workers
  has_many :projects
  has_many :tasks, through: :projects
end
