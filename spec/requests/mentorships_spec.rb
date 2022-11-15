# frozen_string_literal: true

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

RSpec.describe('/mentorships', type: :request) do
  # This should return the minimal set of attributes required to create a valid
  # Mentorship. As you add validations to Mentorship, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Mentorship.create!(valid_attributes)
      get mentorships_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      mentorship = Mentorship.create!(valid_attributes)
      get mentorship_url(mentorship)
      expect(response).to(be_successful)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_mentorship_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      mentorship = Mentorship.create!(valid_attributes)
      get edit_mentorship_url(mentorship)
      expect(response).to(be_successful)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Mentorship' do
        expect do
          post(mentorships_url, params: { mentorship: valid_attributes })
        end.to(change(Mentorship, :count).by(1))
      end

      it 'redirects to the created mentorship' do
        post mentorships_url, params: { mentorship: valid_attributes }
        expect(response).to(redirect_to(mentorship_url(Mentorship.last)))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Mentorship' do
        expect do
          post(mentorships_url, params: { mentorship: invalid_attributes })
        end.to(change(Mentorship, :count).by(0))
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post mentorships_url, params: { mentorship: invalid_attributes }
        expect(response).to(be_successful)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested mentorship' do
        mentorship = Mentorship.create!(valid_attributes)
        patch mentorship_url(mentorship), params: { mentorship: new_attributes }
        mentorship.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the mentorship' do
        mentorship = Mentorship.create!(valid_attributes)
        patch mentorship_url(mentorship), params: { mentorship: new_attributes }
        mentorship.reload
        expect(response).to(redirect_to(mentorship_url(mentorship)))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        mentorship = Mentorship.create!(valid_attributes)
        patch mentorship_url(mentorship), params: { mentorship: invalid_attributes }
        expect(response).to(be_successful)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested mentorship' do
      mentorship = Mentorship.create!(valid_attributes)
      expect do
        delete(mentorship_url(mentorship))
      end.to(change(Mentorship, :count).by(-1))
    end

    it 'redirects to the mentorships list' do
      mentorship = Mentorship.create!(valid_attributes)
      delete mentorship_url(mentorship)
      expect(response).to(redirect_to(mentorships_url))
    end
  end
end
