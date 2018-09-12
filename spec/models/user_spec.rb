require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(50) }

    it { is_expected.to validate_length_of(:surname).is_at_least(2).is_at_most(50) }
  end
end
