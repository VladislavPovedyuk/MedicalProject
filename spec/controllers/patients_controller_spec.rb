require 'spec_helper'

describe PatientsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end


  describe "POST #create" do
    context "with valid attributes" do
      it "creates new object" do
        expect{
          post :create, patient: FactoryGirl.attributes_for(:vasia) , doctors: FactoryGirl.attributes_for(:richards2)
        }.to change(Patient, :count).by(1)
      end

      it "redirects to new patient path" do
        post :create, patient: FactoryGirl.attributes_for(:vasia) , doctors: FactoryGirl.attributes_for(:richards2)
        expect(response).to redirect_to new_patient_path
      end
    end

    context "with not valid attributes" do
      it "not save object to db" do
        expect{
          post :create, patient: FactoryGirl.attributes_for(:vasia_error1)
        }.to_not change(Patient, :count)
      end

      it "render new view" do
        post :create, patient: FactoryGirl.attributes_for(:vasia_error1)
        expect(response).to render_template :new
      end
    end
  end

end
