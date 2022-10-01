require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/goals", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Goal. As you add validations to Goal, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Goal.create! valid_attributes
      get goals_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      goal = Goal.create! valid_attributes
      get goal_url(goal)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_goal_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      goal = Goal.create! valid_attributes
      get edit_goal_url(goal)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Goal" do
        expect {
          post goals_url, params: { goal: valid_attributes }
        }.to change(Goal, :count).by(1)
      end

      it "redirects to the created goal" do
        post goals_url, params: { goal: valid_attributes }
        expect(response).to redirect_to(goal_url(Goal.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Goal" do
        expect {
          post goals_url, params: { goal: invalid_attributes }
        }.to change(Goal, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post goals_url, params: { goal: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested goal" do
        goal = Goal.create! valid_attributes
        patch goal_url(goal), params: { goal: new_attributes }
        goal.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the goal" do
        goal = Goal.create! valid_attributes
        patch goal_url(goal), params: { goal: new_attributes }
        goal.reload
        expect(response).to redirect_to(goal_url(goal))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        goal = Goal.create! valid_attributes
        patch goal_url(goal), params: { goal: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested goal" do
      goal = Goal.create! valid_attributes
      expect {
        delete goal_url(goal)
      }.to change(Goal, :count).by(-1)
    end

    it "redirects to the goals list" do
      goal = Goal.create! valid_attributes
      delete goal_url(goal)
      expect(response).to redirect_to(goals_url)
    end
  end
end
