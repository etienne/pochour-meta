class UsersController < Devise::RegistrationsController
  def show
    @user = User.find(params[:id])
  end
  
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end