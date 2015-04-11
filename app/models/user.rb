class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # D:  Removed registerable - no signups allowed.
  devise :database_authenticatable, :recoverable,
	 :rememberable, :trackable, :validatable
	
	belongs_to :employee 
	
end
