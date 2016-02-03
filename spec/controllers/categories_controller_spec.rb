require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) {FactoryGirl.create(:category)}

  describe "GET #index" do
    it "returns http success" do
      category
      get :index, id: category
      expect(response).to have_http_status(:success)
    end
    
    it 'assigns the category instance variable' do
      category = FactoryGirl.create(:category)
      get :index, id: category
      expect(assigns(:category)).to eq([category]) 
    end

    it 'renders the index template' do
      get :index, id: category
      expect(response).to render_template('index')
    end
  end

  describe "GET #new" do
    it "returns http success" do
      category
      get :new, id: category
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new, id: category
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it 'creates a new category successfully' do
      post :create, {category: {name: 'asdf', description:'asdf'}}
      expect(Category.count).to eq(1)
    end

    it 'fails to create a new category with a blank name' do
      post :create, {category: {name: ''}}
      expect(Category.count).to eq(0)
    end
    it 'fails to create a new category with a non-unique name' do
      biometric
      post :create, {category: {name: 'Strength'}}
      expect(Category.count).to eq(1)
    end
    
    it 'redirects after a create' do
      post :create, {category: {name: 'asdf', description:'asdf'}}
      expect(response).to have_http_status(:redirect)
    end
    
    it 'renders the new template if it fails' do
      workout
      post :create, {category: {name: '', description:'asdf'}}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      category = FactoryGirl.create(:category)
      get :edit, id: category.id
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      category = FactoryGirl.create(:category)
      get :edit, id: category.id
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    it 'update a category successfully' do
      category = FactoryGirl.create(:category)
      expect(category.name).to eq('Strength')
      put :update, {category: {name: 'Crackerjack'}}
      expect(category.reload.name).to eq('Crackerjack')
      expect(response).to have_http_status(:redirect)
    end

    it 'does not update category with a blank name' do
      category = FactoryGirl.create(:category)
      expect(category.name).to eq('Strength')
      put :update, {category: {name: nil}}
      expect(category.reload.name).to eq('Strength')
    end

  end

  describe 'DELETE #destroy' do
    it 'deletes a category successfully' do
      category = FactoryGirl.create(:category)
      expect(Category.count).to eq(1)
      delete :destroy, id: category.id
      expect(Category.count).to eq(0)
      expect(response).to have_http_status(:redirect)
    end
  end
end