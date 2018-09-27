require "shoulda/matchers"
require "rails_helper"

describe Course, type: :model do
  let(:course) {FactoryBot.build :course}
  subject{course}
  describe "association" do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:description)}
    it {is_expected.to validate_presence_of(:content)}
  end
  describe "validates" do
    it {is_expected.to have_many(:lessons).dependent(:destroy)}
  end
end
