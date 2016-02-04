require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do
  let(:workout) {FactoryGirl.create(:workout)}
  let(:user) {FactoryGirl.create(:user)}

  describe "GET #index" do
    it "returns http success" do
      sign_in(user)
      workout
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it 'assigns the workout instance variable' do
      workout = FactoryGirl.create(:workout)
      get :index
      expect(assigns(:workouts_original)).to eq([workout]) 
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in(user)
      workout
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it 'creates a new workout successfully' do
      sign_in(user)
      post :create, {workout: {name:"Beastmaker", category:"Misc"}}
      expect(Workout.count).to eq(1)
    end

    it 'fails to create a new workout with a blank name' do
      sign_in(user)
      post :create, {workout: {name:"", category:"Misc"}}
      expect(Workout.count).to eq(0)
    end
    
    it 'redirects after a create' do
      sign_in(user)
      post :create, {workout: {name:"Beastmaker", category:"Misc"}}
      expect(response).to have_http_status(:redirect)
    end
    
    it 'renders the new template if it fails to create' do
      sign_in(user)
      workout
      post :create, {workout: {name:"", category:"Misc"}}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      workout = FactoryGirl.create(:workout)
      get :edit, id: workout
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      workout = FactoryGirl.create(:workout)
      get :edit, id: workout
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    it 'update a workout successfully' do
      workout = FactoryGirl.create(:workout)
      expect(workout.name).to eq('Day 1')
      put :update, {id: workout.id, workout: {name: 'Crackerjack'}}
      expect(workout.reload.name).to eq('Crackerjack')
      expect(response).to have_http_status(:redirect)
    end

    it 'does not update workout with a blank name' do
      workout = FactoryGirl.create(:workout)
      expect(workout.name).to eq('Day 1')
      put :update, {id: workout.id, workout: {name: nil}}
      expect(workout.reload.name).to eq('Day 1')
    end

  end

  describe 'DELETE #destroy' do
    it 'deletes a workout successfully and redirects to workout path' do
      workout = FactoryGirl.create(:workout)
      expect(Workout.count).to eq(1)
      delete :destroy, id: workout
      expect(Workout.count).to eq(0)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'delete workout' do
    it 'deletes and workout and redirects to workouts path' do
      workout = FactoryGirl.create(:workout)
      expect(Workout.count).to eq(1)
      delete :delete_workout, id: workout
      expect(Workout.count).to eq(0)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'remove workout' do
    it 'deletes and workout and redirects to root path' do
      workout = FactoryGirl.create(:workout)
      expect(Workout.count).to eq(1)
      delete :remove_workout, id: workout
      expect(Workout.count).to eq(0)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'FINISH #finish' do
    it 'update workout to have complete status true'do
      workout
      put :finish, id: workout
      expect(response).to have_http_status(:redirect)
    end
    it 'renders edit on fail' do
    end
  end
  describe 'add workout' do
    it 'creates a new workout template clone' do
      sign_in(user)
      workout.update(user_id: user)
      workout.exercises.create(name: "larry", weight: 12, repetitions: 12)
      post :add_workout, id: workout
      expect(Workout.count).to eq(2)
      expect(workout.exercises.count).to_not eq(0)
      expect(response).to have_http_status(:redirect)
    end
  end
  describe 'do workout' do
    it 'creates a new workout clone for you to finish' do
      sign_in(user)
      workout.update(user_id: user)
      workout.exercises.create(name: "larry", weight: 12, repetitions: 12)
      post :do_workout, id: workout
      expect(Workout.count).to eq(2)
      expect(workout.exercises.count).to_not eq(0)
      expect(response).to have_http_status(:redirect)
    end
  end
end