# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject { build(:doctor, phone:) }

  let(:phone) { '380681234561' }

  describe 'validations'
  it 'is valid with unique phone' do
    expect(subject).to be_valid
  end

  context 'when phone is used other user' do
    before do
      create(:doctor, phone:)
    end

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'with long number' do
    let(:phone) { '31231231231231231' }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'with short number' do
    let(:phone) { '31231355' }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end
end
