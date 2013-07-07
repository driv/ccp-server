FactoryGirl.define do
	
	factory :user do |user|
		sequence(:username) { |n| "example_#{n}" }
	end

	factory :clip do
		payload 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas, eum, temporibus eligendi velit neque inventore a aperiam necessitatibus maiores ratione adipisci molestiae illo ipsum accusantium impedit omnis quasi itaque doloremque?'
		user
	end
end