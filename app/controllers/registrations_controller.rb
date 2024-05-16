require 'net/http'
require 'json'
class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      user.country = get_user_country(request.remote_ip)
      user.city = params[:user][:city]
      user.save
    end
  end

  def get_user_country(ip)
    # Commented as HTTP request have limit and unwanted during tests
    #  response = Net::HTTP.get_response(URI("http://api.ipstack.com/#{ip}?access_key=39c710cfea386dee40fb9686fc94fc31"))

    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      data['country_name']
    else
      'Unknown'
    end
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.email.ends_with?('@gmail.com', '@karazin.ua')
      new_profile_path # Redirect to new profile creation after sign up for @gmail.com and @karazin.ua
    else
      root_path # Redirect to the root path for other email domains
    end
  end

  def after_inactive_sign_up_path_for(resource)
    if resource.email.ends_with?('@gmail.com', '@karazin.ua')
      new_profile_path # Redirect to new profile creation after sign up for @gmail.com and @karazin.ua (for inactive users)
    else
      root_path # Redirect to the root path for other email domains (for inactive users)
    end
  end

  def after_update_path_for(resource)
    edit_user_registration_path(resource) # Redirect to edit profile after update
  end

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource) # Automatically sign in the user after confirmation
    new_session_path(resource_name) # Redirect to a new session (sign in) path
  end

  def after_resetting_password_path_for(resource)
    if resource.email.ends_with?('@gmail.com', '@karazin.ua')
      new_profile_path # Redirect to new profile creation after resetting password for @gmail.com and @karazin.ua
    else
      root_path # Redirect to the root path for other email domains after resetting password
    end
  end


end