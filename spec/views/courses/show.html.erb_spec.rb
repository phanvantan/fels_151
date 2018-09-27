require "shoulda/matchers"
require "rails_helper"

describe "courses/show" do
  let!(:course) {FactoryBot.create :course}
  describe "GET #show/:id" do
    it "show course" do
      assign(:course, course)
      render
      expect(rendered).to match course.content
    end
  end
end
