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
				response.code.should eq('200')
			end

			describe 'get last clip' do

				let(:user) { FactoryGirl.create(:user) }
				let!(:clip_1) { FactoryGirl.create(:clip, user: user, created_at: 1.hour.ago) }
				let!(:clip_2) { FactoryGirl.create(:clip, user: user, created_at: 2.hour.ago) }


				def get_last_clip(user)
					get :show, user_id: user.id, id: 'last'
				end

				it { user.clips.count.should eq(2) }

				it 'should return the newest clip' do
					get_last_clip(user)
					parsed = JSON.parse(response.body)
					parsed['id'].should eq(clip_1.id)
				end

			end
		end
	end
end