require 'rails_helper'

describe UsersController do
  let!(:user) { create(:user) }
  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders index template' do
      get :index
      is_expected.to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders show template' do
      get :show, params: { id: user.id }
      is_expected.to render_template(:show)
    end
  end
end
