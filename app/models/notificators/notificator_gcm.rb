class NotificatorGCM < Notificator

	@@api_key = 'AIzaSyD9aigyJeangWPU4psJ4lv-Xwwf39LTHfc'
	@@gcm = GCM.new(@@api_key)
	#move this to some configuration file

	def notify(payload)
		generation_id = [@parameters['generation_id']]
		options = {data: { payload: payload } }
	end

	register_notificator :GCM

end