class Quote < ApplicationRecord
	attr_writer :current_step
	has_one :subscription
	accepts_nested_attributes_for :subscription

	validates_presence_of :user_email, :user_name, :user_phone, :if => lambda { |o| o.current_step == 'user_details' }
	# validates_presence_of :user_email, :user_name, :user_phone, :if => lambda { |o| o.current_step == 'user_details' }
	
	
	def current_step
		@current_step || steps.first
	end

	def steps
		%w[user_details products confirmation]
	end

	def next_step
		self.current_step = steps[steps.index(current_step)+1]
	end

	def previous_step
		self.current_step = steps[steps.index(current_step)-1]
	end

	def first_step?
		current_step == steps.first
	end

	def last_step?
		current_step == steps.last
	end

	def set_q_key
		self.q_key = SecureRandom.urlsafe_base64(nil, false)
	end
end
