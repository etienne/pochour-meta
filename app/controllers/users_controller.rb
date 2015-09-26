class UsersController < Devise::RegistrationsController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end