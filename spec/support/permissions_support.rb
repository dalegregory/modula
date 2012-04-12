module PermissionsMatcher

  include Rails.application.routes.url_helpers

  RSpec::Matchers.define :allow_access_to do |who|

    login_as send(who) unless who == :guest

    visit path
    match_for_should     { current_path == path }
    match_for_should_not { current_path != path }

    description do
      "allow #{ who.inspect } to access #{ helper_from path }"
    end

    failure_message_for_should_not do
      "#{ who.inspect } should not be able to access #{ helper_from path }"
    end

  end

  def helper_from path
    hash = Rails.application.routes.recognize_path(path)
    "#{ hash[:controller] }##{ hash[:action] }"
  end

end
