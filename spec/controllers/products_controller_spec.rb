require 'rails_helper'
describe ProductsController, type: :controller do

  describe 'GET #index' do
    it "populates an array of products ordered by all" do
      products = create_list(:product, 3) 
      get :index
      expect(assigns(:products)).to match(products)
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      product = create(:product)
      get :show, params: {  id: product.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "renders the :edit template" do
      product = create(:product)
      get :edit, params: { id: product }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #search' do
  it "populates an array of products ordered by Category.all" do
    categories = create_list(:category, 3) 
    get :search
    expect(assigns(:categories)).to match(categories)
  end
    it "populates an array of products ordered by created_at DESC" do
      products = create_list(:product, 3) 
      get :search
      expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at } )
    end
    it "renders the :search template" do
      get :search
      expect(response).to render_template :search
    end
  end

  describe 'GET #finish' do
    it "renders the :finish template" do
      get :finish
      expect(response).to render_template :finish
    end
  end
end