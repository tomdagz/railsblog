class Article < ActiveRecord::Base
	validates :title, :body, presence: true
	validates :body, length: { minimum:20 }
	validates :title, uniqueness: true
end
