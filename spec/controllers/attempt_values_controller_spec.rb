require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AttemptValuesController do

  # This should return the minimal set of attributes required to create a valid
  # AttemptValue. As you add validations to AttemptValue, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AttemptValuesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all attempt_values as @attempt_values" do
      attempt_value = AttemptValue.create! valid_attributes
      get :index, {}, valid_session
      assigns(:attempt_values).should eq([attempt_value])
    end
  end

  describe "GET show" do
    it "assigns the requested attempt_value as @attempt_value" do
      attempt_value = AttemptValue.create! valid_attributes
      get :show, {:id => attempt_value.to_param}, valid_session
      assigns(:attempt_value).should eq(attempt_value)
    end
  end

  describe "GET new" do
    it "assigns a new attempt_value as @attempt_value" do
      get :new, {}, valid_session
      assigns(:attempt_value).should be_a_new(AttemptValue)
    end
  end

  describe "GET edit" do
    it "assigns the requested attempt_value as @attempt_value" do
      attempt_value = AttemptValue.create! valid_attributes
      get :edit, {:id => attempt_value.to_param}, valid_session
      assigns(:attempt_value).should eq(attempt_value)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AttemptValue" do
        expect {
          post :create, {:attempt_value => valid_attributes}, valid_session
        }.to change(AttemptValue, :count).by(1)
      end

      it "assigns a newly created attempt_value as @attempt_value" do
        post :create, {:attempt_value => valid_attributes}, valid_session
        assigns(:attempt_value).should be_a(AttemptValue)
        assigns(:attempt_value).should be_persisted
      end

      it "redirects to the created attempt_value" do
        post :create, {:attempt_value => valid_attributes}, valid_session
        response.should redirect_to(AttemptValue.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved attempt_value as @attempt_value" do
        # Trigger the behavior that occurs when invalid params are submitted
        AttemptValue.any_instance.stub(:save).and_return(false)
        post :create, {:attempt_value => {}}, valid_session
        assigns(:attempt_value).should be_a_new(AttemptValue)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AttemptValue.any_instance.stub(:save).and_return(false)
        post :create, {:attempt_value => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested attempt_value" do
        attempt_value = AttemptValue.create! valid_attributes
        # Assuming there are no other attempt_values in the database, this
        # specifies that the AttemptValue created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AttemptValue.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => attempt_value.to_param, :attempt_value => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested attempt_value as @attempt_value" do
        attempt_value = AttemptValue.create! valid_attributes
        put :update, {:id => attempt_value.to_param, :attempt_value => valid_attributes}, valid_session
        assigns(:attempt_value).should eq(attempt_value)
      end

      it "redirects to the attempt_value" do
        attempt_value = AttemptValue.create! valid_attributes
        put :update, {:id => attempt_value.to_param, :attempt_value => valid_attributes}, valid_session
        response.should redirect_to(attempt_value)
      end
    end

    describe "with invalid params" do
      it "assigns the attempt_value as @attempt_value" do
        attempt_value = AttemptValue.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AttemptValue.any_instance.stub(:save).and_return(false)
        put :update, {:id => attempt_value.to_param, :attempt_value => {}}, valid_session
        assigns(:attempt_value).should eq(attempt_value)
      end

      it "re-renders the 'edit' template" do
        attempt_value = AttemptValue.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AttemptValue.any_instance.stub(:save).and_return(false)
        put :update, {:id => attempt_value.to_param, :attempt_value => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested attempt_value" do
      attempt_value = AttemptValue.create! valid_attributes
      expect {
        delete :destroy, {:id => attempt_value.to_param}, valid_session
      }.to change(AttemptValue, :count).by(-1)
    end

    it "redirects to the attempt_values list" do
      attempt_value = AttemptValue.create! valid_attributes
      delete :destroy, {:id => attempt_value.to_param}, valid_session
      response.should redirect_to(attempt_values_url)
    end
  end

end