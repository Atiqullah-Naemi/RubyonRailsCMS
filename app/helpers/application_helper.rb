module ApplicationHelper
	def status_convertor(status, is_true: 'Active', is_false: 'Drafe')
		if status
			is_true
		else
			is_false
		end
	end
end
