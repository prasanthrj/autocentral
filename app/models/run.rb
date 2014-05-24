class Run < ActiveRecord::Base

	def self.search(query)
		where("cycle like ? OR testcase_name like ? OR project like ? OR testcase_status like ?","%#{query}%" , "%#{query}%", "%#{query}%" , "%#{query}%")
	end

end
