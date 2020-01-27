class Course

	attr_accessor :title, :schedule, :description

	ALL = []

	def initialize(args={})
		args.each do |key, value|
			self.send("#{key}=", value)
		end
		save
	end

	def save
		ALL << self
	end

	def self.all
		ALL
	end

	def self.reset_all
		ALL.clear
	end

end