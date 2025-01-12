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

  def path_data
    case controller_name
    when "blogs"
      { text: "Restaurants", path: restaurants_path }
    when "restaurants"
      { text: "Blogs", path: blogs_path }
    else
      { text: "Home", path: root_path }
    end
  end

  def toggle_auth_button
    if user_signed_in?
      link_to "Logout", destroy_user_session_path, data: { turbo_method: :delete }, class: 'nav-link link-danger'
    else
      link_to "Login", new_user_session_path, class: "nav-link"
    end
  end
end
