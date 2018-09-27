require "shoulda/matchers"
require "rails_helper"

describe CoursesController, type: :controller do
  let(:course) {FactoryBot.create :course}
  let(:user) {FactoryBot.create :user}
  before {login user}

  describe "GET #index" do
    before {get :index}
    it "renders the index template" do
      is_expected.to render_template :index
    end

    it "assigns @courses" do
      expect(assigns :courses).to eq [course]
    end
  end

  describe "GET #show/:id" do
    context "found course" do
      before {get :show, params: {id: course.id}}
      it "assigns the course to @course" do
        expect(assigns :course).to eq course
      end

      it "renders the show template" do
        is_expected.to render_template :show
      end
    end

    context "not found course" do
      before {get :show, params: {id: -1}}
      it "show error messages" do
        expect(flash[:danger]).to eq (I18n.t "courses.show.cant_find_course")
      end

      it "renders the index template" do
        is_expected.to redirect_to courses_path
      end
    end
  end
end
