class Run < ActiveRecord::Base

	def self.search(query)
		where("cycle like ? OR testcase_name like ? OR project like ? OR testcase_status like ?","%#{query}%" , "%#{query}%", "%#{query}%" , "%#{query}%")
	end

	 def self.to_csv
     CSV.generate do |csv|
      csv << column_names
      all.each do |run|
      csv << run.attributes.values_at(*column_names)
      end
    end
  end


end
