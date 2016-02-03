require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}

  describe "GET #show" do
   it "returns http success" do
     user = FactoryGirl.create(:user)
     sign_in(user)
     get :show, id: user.id
     expect(response).to have_http_status(:success)
   end

   it 'renders show template' do
     user = FactoryGirl.create(:user)
     sign_in(user)
     get :show, id: user.id
     expect(response).to render_template(:show)
   end

   it 'sets the user instance vairable' do
     user = FactoryGirl.create(:user)
     sign_in(user)
     get :show, id: user.id
     expect(assigns(:user)).to eq(user)
   end
  end
end