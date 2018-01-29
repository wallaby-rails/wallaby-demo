class OperatorController < Wallaby::ResourcesController
  def resource_params
    params.require(:operator).permit(:email, :type, :password, :password_confirmation)
  end
end
