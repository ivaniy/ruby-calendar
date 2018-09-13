require 'rails_helper'

describe EventsController do
  let!(:user) { create(:user) }
  let!(:event) { create(:event, user: user) }

  before(:each) do #######
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
      get :show, params: { id: event.id }
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
      get :edit, params: { id: event.id }
      is_expected.to render_template(:edit)
    end
  end

  describe 'POST #create' do
    before(:each) do
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'when event is valid' do
      let(:valid_event_attributes) { attributes_for(:event) }
      subject { post :create, params: { event: valid_event_attributes } }

      it 'creates an event' do
        expect(Event.find_by(name: valid_event_attributes[:name])).to be_present
        # .valid?
        # to be_valid
      end

      it { is_expected.to redirect_to(root_path) }
    end

    context 'when event is invalid' do
      let(:invalid_event_attributes) { attributes_for(:event, name: Faker::Lorem.characters(100) ) }

      it 'renders new template' do
        post :create, params: { event: invalid_event_attributes }
        is_expected.to render_template(:new)
      end
    end
  end

  describe 'POST #update' do
    context 'when new data is valid' do
      let(:new_valid_name) { Faker::Lorem.characters(10) }
      subject { put :update, params: { id: event.id, event: attributes_for(:event, name: new_valid_name) } }

      it 'updates an event' do
        subject
        expect(Event.find_by(id: event.id).name).to eq(new_valid_name)
      end

      it { is_expected.to redirect_to(root_path) }
    end

    context 'when new data is invalid' do
      let(:new_invalid_name) { Faker::Lorem.characters(100) }

      it 'renders edit template' do
        put :update, params: { id: event.id, event: attributes_for(:event, name: new_invalid_name) }
        is_expected.to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: event.id } }

    it 'deletes the event' do
      subject
      expect(Event.find_by(id: event.id)).to eq(nil)
    end

    it { is_expected.to redirect_to(root_path) }
  end
end
