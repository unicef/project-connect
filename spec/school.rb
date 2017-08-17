require 'spec_helper'
require 'rails_helper'

RSpec.describe School, :type => :model do
  subject { described_class.create(
    country_code: "BBB",
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do

      expect(subject.errors.messages).to include(owner: ["can't be blank"])
      expect(subject.errors.messages).to include(country_code: ["is the wrong length (should be 2 characters)"])
      expect(subject.errors.messages).to include(is_private: ["is not included in the list"])
      expect(subject.errors.messages).to include(provider_is_private: ["is not included in the list"])
    end
  end
end
