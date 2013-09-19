namespace :db do
	desc 'Erase and fill database'
	task :populate => :environment do
		require 'populator'
		User.delete_all
		Clip.delete_all
		User.populate(1) do |user|
			user.username = 'driv'
			user.password = 'fdsafdsa'
			Clip.populate(1) do |clip|
				clip.user_id = user.id
				clip.payload = 'test payload'
			end
		end
	end
end