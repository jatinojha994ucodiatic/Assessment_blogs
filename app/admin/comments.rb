ActiveAdmin.register Comment, as: "AdminComment" do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :article_id, :user_id, :comment
  #
  # or
  #
  # permit_params do
  #   permitted = [:article_id, :user_id, :comment]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
