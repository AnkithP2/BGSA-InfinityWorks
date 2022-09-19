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

RSpec.describe "/admins", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Admin. As you add validations to Admin, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Admin.create! valid_attributes
      get admins_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      admin = Admin.create! valid_attributes
      get admin_url(admin)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      admin = Admin.create! valid_attributes
      get edit_admin_url(admin)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin" do
        expect {
          post admins_url, params: { admin: valid_attributes }
        }.to change(Admin, :count).by(1)
      end

      it "redirects to the created admin" do
        post admins_url, params: { admin: valid_attributes }
        expect(response).to redirect_to(admin_url(Admin.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin" do
        expect {
          post admins_url, params: { admin: invalid_attributes }
        }.to change(Admin, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admins_url, params: { admin: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin" do
        admin = Admin.create! valid_attributes
        patch admin_url(admin), params: { admin: new_attributes }
        admin.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin" do
        admin = Admin.create! valid_attributes
        patch admin_url(admin), params: { admin: new_attributes }
        admin.reload
        expect(response).to redirect_to(admin_url(admin))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        admin = Admin.create! valid_attributes
        patch admin_url(admin), params: { admin: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin" do
      admin = Admin.create! valid_attributes
      expect {
        delete admin_url(admin)
      }.to change(Admin, :count).by(-1)
    end

    it "redirects to the admins list" do
      admin = Admin.create! valid_attributes
      delete admin_url(admin)
      expect(response).to redirect_to(admins_url)
    end
  end
end
