require 'rails_helper'

describe EventsController do
  let!(:valid_event) { create(:valid_event) }

  before { sign_in valid_event.users.first }

  describe 'GET #index' do
    it 'renders index template' do
      get :index
      is_expected.to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders show template' do
      get :show, params: { id: valid_event.id }
      is_expected.to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'renders new template' do
      get :new
      is_expected.to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'renders edit template' do
      get :edit, params: { id: valid_event.id }
      is_expected.to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context 'when event is valid' do
      it { expect(valid_event).to be_valid }

      it { expect(Event.find_by(id: valid_event.id)).to be_present }

      it 'redirects to root path' do
        post :create, params: { event: valid_event.attributes }
        is_expected.to redirect_to(root_path)
      end
    end

    context 'when event is invalid' do
      let(:invalid_event) { build(:invalid_event) }

      it { expect(invalid_event).not_to be_valid }

      it 'renders new template' do
        post :create, params: { event: invalid_event.attributes }
        is_expected.to render_template(:new)
      end
    end
  end

  describe 'POST #update' do
    context 'when new data is valid' do
      let(:new_valid_name) { Faker::Lorem.characters(15) }

      subject { put :update, params: { id: valid_event.id, event: attributes_for(:valid_event, name: new_valid_name) } }

      it 'updates an event' do
        subject
        expect(Event.find_by(id: valid_event.id).name).to eq(new_valid_name)
      end

      it { is_expected.to redirect_to(root_path) }
    end

    context 'when new data is invalid' do
      let(:new_invalid_name) { Faker::Lorem.characters(100) }

      it 'renders edit template' do
        put :update, params: { id: valid_event.id, event: attributes_for(:valid_event, name: new_invalid_name) }
        is_expected.to render_template(:edit)
      end
    end
  end
end
