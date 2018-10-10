require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    subject { create :valid_event }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(30) }

    it { is_expected.to validate_length_of(:description).is_at_most(500) }

    it { is_expected.to validate_length_of(:location).is_at_most(100) }

    it { is_expected.to validate_presence_of(:date) }

    context 'when start time is more then end time' do
      it 'raises error' do
        expect { create(:invalid_event) }.to raise_error(/must be after start time/)
      end
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:users).through(:events_users) }
  end
end
