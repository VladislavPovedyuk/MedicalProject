require 'spec_helper'

describe DoctorsController do

  # GET
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

  describe "GET #edit" do

    subject { FactoryGirl.create(:richards) }

    it "assigns the requested doctor to subject" do
      get :edit, id: subject
      expect(assigns(:doctor)).to eq(subject)
    end

    it "renders the :edit view" do
      get :edit, id: subject
      expect(response).to render_template :edit
    end
  end

  describe "GET #show" do

    subject { FactoryGirl.create(:richards) }

    it "assigns the requested doctor to subject" do
      get :show, id: subject
      expect(assigns(:doctor)).to eq(subject)
    end

    it "renders the :show view" do
      get :show, id: subject
      expect(response).to render_template :show
    end
  end


  # POST
  describe "POST #create" do
    context "with valid attributes" do
      it "creates new object" do
        expect{
          post :create, doctor: FactoryGirl.attributes_for(:richards)
        }.to change(Doctor, :count).by(1)
      end

      it "rendirects to doctors path" do
        post :create, doctor: FactoryGirl.attributes_for(:richards)
        expect(response).to redirect_to doctors_path
      end
    end



    context "with not valid attributes" do
      it "not save object to db" do
        expect{
          post :create, doctor: FactoryGirl.attributes_for(:doctor_not_valid2)
        }.to_not change(Doctor, :count)
      end

      it "render new view" do
        post :create, doctor: FactoryGirl.attributes_for(:doctor_not_valid2)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do

    subject { FactoryGirl.create(:richards) }

    context "with valid attributes" do
      it "updates object" do
        expect{
          patch :update, id: subject, doctor: { name: 'New name' }
        }.to change{ subject.reload.name }.to('New name')
      end

      it "rendirects to edit doctor path" do
        patch :update, id: subject, doctor: { name: 'new_project' }
        expect(response).to redirect_to edit_doctor_path
      end
    end

    context "with not valid attributes" do
      it "not save object to db" do
        expect{
          patch :update, id: subject, doctor: FactoryGirl.attributes_for(:doctor_not_valid2)
        }.to_not change{ subject.name }
      end

      it "render edit view" do
        post :update, id: subject, doctor: FactoryGirl.attributes_for(:doctor_not_valid2)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) { @doctor = FactoryGirl.create :richards }

    it "doctor is deleted" do
      expect {
        delete :destroy, id: @doctor
      }.to change(Doctor, :count).by(-1)
    end

    it "redirects to doctors path" do
      delete :destroy, id: @doctor
      expect(response).to redirect_to doctors_path
    end
  end

end
