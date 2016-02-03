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

  describe "GET #new" do
    it "returns http success" do
      sign_in(user)
      workout
      get :new, workout_id: workout.id, user_id: user.id
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new, workout_id: workout.id, user_id: user.id
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it 'creates a new exercise successfully' do
      sign_in(user)
      workout
      post :create, {workout_id: workout.id, exercise: {name: 'deadlift', workout_id: workout}}
      expect(workout.exercises.count).to eq(1)
    end

    it 'fails to create a new exercise with a blank name' do
      sign_in(user)
      workout
      post :create, {workout_id: workout.id, exercise: {name: '', workout_id: workout}}
      expect(workout.exercises.count).to eq(0)
    end
    
    it 'redirects after a create' do
      sign_in(user)
      workout
      post :create, {workout_id: workout.id, exercise: {name: 'deadlift', weight: 12, repetitions: 1, workout_id: workout}}
      expect(response).to have_http_status(:redirect)
    end
    
    it 'renders the new template if it fails' do
      sign_in(user)
      workout
      post :create, {workout_id: workout.id, exercise: {name: '', workout_id: workout}}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      exercise = FactoryGirl.create(:exercise)
      get :edit, workout_id: exercise.workout_id, id: exercise.id
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      exercise = FactoryGirl.create(:exercise)
      get :edit, workout_id: exercise.workout_id, id: exercise.id
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    it 'update a exercise successfully' do
      exercise = FactoryGirl.create(:exercise)
      expect(exercise.name).to eq('deadlift')
      put :update, {workout_id: exercise.workout_id, id: exercise.id, exercise: {name: 'Crackerjack'}}
      expect(exercise.reload.name).to eq('Crackerjack')
      expect(response).to have_http_status(:redirect)
    end

    it 'does not update exercise with a blank name' do
      exercise = FactoryGirl.create(:exercise)
      expect(exercise.name).to eq('deadlift')
      put :update, {workout_id: exercise.workout_id, id: exercise.id, exercise: {name: nil}}
      expect(exercise.reload.name).to eq('deadlift')
    end

  end

  describe 'DELETE #destroy' do
    it 'deletes a exercise successfully' do
      exercise = FactoryGirl.create(:exercise)
      expect(Exercise.count).to eq(1)
      delete :destroy, workout_id: exercise.workout_id, id: exercise.id
      expect(Exercise.count).to eq(0)
      expect(response).to have_http_status(:redirect)
    end
  end
end