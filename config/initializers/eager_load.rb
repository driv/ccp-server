rails_root = Rails.root.to_s

#Registering all Notificators
Dir[%Q(#{rails_root}/app/models/notificators/*.rb)].each {|file| require file }