class Book < ApplicationRecord

	belongs_to :user

	validates :body, length: {maximum:200}
	
end
