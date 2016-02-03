require 'rails_helper'

RSpec.describe BiometricsController, type: :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:biometric) {FactoryGirl.create(:biometric)}

  describe "GET #index" do
    it "returns http success" do
      sign_in(User.find(biometric.user_id))
      biometric
      get :index, user_id: user.id, biometric_id: biometric
      expect(response).to have_http_status(:success)
    end
    
    it 'assigns the biometric instance variable' do
      sign_in(User.find(biometric.user_id))
      biometric
      get :index, user_id: user, id: biometric
      expect(assigns(:biometrics)).to eq([biometric]) 
    end

    it 'renders the index template' do
      sign_in(User.find(biometric.user_id))
      biometric
      get :index, user_id: user, id: biometric
      expect(response).to render_template('index')
    end
  end

  describe "GET #new" do
    it "returns http success" do
      biometric
      sign_in(User.find(biometric.user_id))
      get :new, user_id: biometric.user_id, biometric_id: biometric
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      biometric
      sign_in(User.find(biometric.user_id))
      get :new, user_id: biometric.user_id, biometric_id: biometric
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it 'creates a new biometric successfully' do
      sign_in(user)
      post :create, {user_id: biometric.user_id, biometric: {date: Date.today, weight: 12, body_fat_percentage: 12}}
      expect(user.biometrics.count).to eq(1)
    end

    it 'fails to create a new biometric with a blank weight' do
      biometric
      sign_in(User.find(biometric.user_id))
      post :create, {user_id: biometric.user_id, biometric: {weight: nil}}
      expect(user.biometrics.count).to eq(0)
    end
    it 'fails to create a new biometric with a blank body fat percentage' do
      biometric
      sign_in(User.find(biometric.user_id))
      post :create, {user_id: biometric.user_id, biometric: {body_fat_percentage: nil}}
      expect(user.biometrics.count).to eq(0)
    end
    
    it 'redirects after a create' do
      biometric
      sign_in(User.find(biometric.user_id))
      post :create, {user_id: biometric.user_id, biometric: {date: Date.today, weight: 12, body_fat_percentage: 12}}
      expect(response).to have_http_status(:redirect)
    end
    
    it 'renders the new template if it fails' do
      biometric
      sign_in(User.find(biometric.user_id))
      post :create, {user_id: biometric.user_id, biometric: {date: nil}}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      biometric
      sign_in(User.find(biometric.user_id))
      get :edit, user_id: biometric.user_id, id: biometric.id
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      biometric
      sign_in(User.find(biometric.user_id))
      get :edit, user_id: biometric.user_id, id: biometric.id
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    it 'update a biometric successfully' do
      biometric
      sign_in(User.find(biometric.user_id))
      expect(biometric.weight).to eq(123)
      put :update, {user_id: biometric.user_id, id: biometric.id, biometric: {weight: 15}}
      expect(biometric.reload.weight).to eq(15)
      expect(response).to have_http_status(:redirect)
    end

    it 'does not update biometric with a blank weight' do
      biometric
      sign_in(User.find(biometric.user_id))
      expect(biometric.weight).to eq(123)
      put :update, {user_id: biometric.user_id, id: biometric.id, biometric: {weight: nil}}
      expect(biometric.reload.weight).to eq(123)
    end
    it 'does not update biometric with a blank body fat percentage' do
      biometric
      sign_in(User.find(biometric.user_id))
      expect(biometric.body_fat_percentage).to eq(12)
      put :update, {user_id: biometric.user_id, id: biometric.id, biometric: {body_fat_percentage: nil}}
      expect(biometric.reload.body_fat_percentage).to eq(12)
    end

  end

  describe 'DELETE #destroy' do
    it 'deletes a biometric successfully' do
      biometric
      sign_in(User.find(biometric.user_id))
      expect(Biometric.count).to eq(1)
      delete :destroy, user_id: biometric.user_id, id: biometric.id
      expect(Biometric.count).to eq(0)
      expect(response).to have_http_status(:redirect)
    end
  end
end