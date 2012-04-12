# RailsAdmin config file. Generated on April 12, 2012 15:56
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.attr_accessible_role { :admin }
  config.authorize_with { redirect_to root_path unless warden.user.admin? }
  config.current_user_method { current_user } # auto-generated
  config.main_app_name = ['Modula', 'Admin']

end
