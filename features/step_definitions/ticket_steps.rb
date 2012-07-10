Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
	table.hashes.each do |attributes|
		@project.tickets.create!(attributes)
		@project.tickets.each {|t| t.update_attribute(:user, User.find_by_email!(email))}
	end
end
