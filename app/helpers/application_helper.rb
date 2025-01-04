module ApplicationHelper
  def button_data
    case controller_name
    when "blogs"
      { text: "New Blog", path: new_blog_path }
    when "restaurants"
      { text: "New Restaurant", path: new_restaurant_path }
    else
      { text: "Home", path: root_path }
    end
  end

  def toggle_auth_button
    if user_signed_in?
      link_to "Logout", destroy_user_session_path, data: { turbo_method: :delete }, class: 'btn btn-danger mx-2'
    else
      link_to "Login", new_user_session_path, class: "btn btn-primary"
    end
  end
end
