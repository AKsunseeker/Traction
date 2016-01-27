require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  let(:exercise) {FactoryGirl.create(:exercise)}
  let(:workout) {FactoryGirl.create(:workout)}
  let(:user) {FactoryGirl.create(:user)}

  describe "GET #index" do
    it "returns http success" do
      sign_in(user)
      workout
      get :index, workout_id: workout.id, user_id: user.id
      expect(response).to have_http_status(:success)
    end
    
    it 'assigns the exercise instance variable'do
      exercise = FactoryGirl.create(:exercise)
      get :index, workout_id: workout.id, user_id: user.id
      expect(assigns(:exercises)).to eq([exercise]) 
    end

    it 'renders the index template' do
      get :index, workout_id: workout.id, user_id: user.id
      expect(response).to render_template('index')
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in(user)
      workout
      exercise = FactoryGirl.create(:exercise)
      get :show, workout_id: workout.id, id: exercise.id
      expect(response).to redirect_to(workout_path(workout.id))
    end

    it 'renders show template' do
      exercise = FactoryGirl.create(:exercise)
      get :show, id: exercise.id
      expect(response).to render_template(:show)
    end

    it 'sets the exercise instance vairable' do
      exercise = FactoryGirl.create(:exercise)
      get :show, id: exercise.id
      expect(assigns(:exercise)).to eq(exercise)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

  end


  describe "POST #create" do
    it 'creates a new exercise successfully' do
      post :create, {exercise: {name: 'deadlift'}}
      expect(exercise.count).to eq(1)
    end

    it 'fails to create a new exercise with a blank name' do
      post :create, {exercise: {name: ''}}
      expect(exercise.count).to eq(0)
    end
    
    it 'redirects after a create' do
      post :create, {exercise: {name: 'deadlift'}}
      expect(response).to have_http_status(:redirect)
    end
    
    it 'renders the new template if it fails' do
      post :create, {exercise: {name: ''}}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      exercise = FactoryGirl.create(:exercise)
      get :edit, id: exercise.id
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      exercise = FactoryGirl.create(:exercise)
      get :edit, id: exercise.id
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    it 'update a exercise successfully' do
      exercise = FactoryGirl.create(:exercise)
      expect(exercise.name).to eq('deadlift')
      put :update, {id: exercise.id, exercise: {name: 'Crackerjack'}}
      expect(exercise.reload.name).to eq('Crackerjack')
      expect(response).to have_http_status(:redirect)
    end

    it 'does not update exercise with a blank name' do
      exercise = FactoryGirl.create(:exercise)
      expect(exercise.name).to eq('deadlift')
      put :update, {id: exercise.id, exercise: {name: nil}}
      expect(exercise.reload.name).to eq('deadlift')
    end

  end

  describe 'DELETE #destroy' do
    it 'deletes a exercise successfully' do
      exercise = FactoryGirl.create(:exercise)
      expect(exercise.count).to eq(1)
      delete :destroy, id: exercise.id
      expect(exercise.count).to eq(0)
      expect(response).to have_http_status(:redirect)
    end
  end
end