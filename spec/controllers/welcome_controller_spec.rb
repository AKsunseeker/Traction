require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}

  describe "GET #index" do
    it "returns http success" do
      sign_in(user)
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it 'assigns the exercise instance variable' do
      exercise = FactoryGirl.create(:exercise)
      get :index, workout_id: workout.id, user_id: user.id
      expect(assigns(:exercises)).to eq([exercise]) 
    end

    it 'renders the index template' do
      get :index, workout_id: workout.id, user_id: user.id
      expect(response).to render_template('index')
    end
  end

end