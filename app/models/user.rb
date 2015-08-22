class User < ActiveRecord::Base
  has_many :statuses
  has_many :articles, through: :statuses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :final_entries
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
