class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :title, :body, presence: true
	validates :body, length: { minimum:20 }
	validates :title, uniqueness: true

	before_create :set_visits_count

	def update_visits_count
		self.update(visit_count: self.visit_count + 1 )
	end	

	private
		def set_visits_count
			self.visit_count ||= 0
		end
end
