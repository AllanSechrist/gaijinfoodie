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
end
