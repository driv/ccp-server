require 'spec_helper'

describe ClipsController do
	describe 'CRUD' do
		describe 'create' do
			let(:clip) { FactoryGirl.create(:clip) }

			def create_clip(clip)
			  post( :create , user_id: clip.user.id, clip: clip.attributes ) 
			end

			it 'should respond with created(201) http message' do
				create_clip(clip)
				expect(response.code).to eq '201'
			end

			it 'insert the clip in the database' do
				expect { create_clip clip }.to change{ clip.user.clips.count }.by(1)
			end
		end

		describe 'read' do
			
			let(:clip) { FactoryGirl.create(:clip) }

			def get_clip(clip)
				get :show, user_id: clip.user.id, id: clip.id
			end

			it 'should respond with ok(200) http message' do
				get_clip clip
			end
		end
	end
end