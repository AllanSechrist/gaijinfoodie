module BlogsHelper
  def delete_blog_link(blog)
    return unless current_user&.admin? # Only show if the user is an admin

    link_to(blog_path(blog), data: { turbo_method: :delete, turbo_confirm: "Are you sure?" }, class: 'text-decoration-none text-reset') do
      content_tag(:span, class: "me-2") do
        content_tag(:i, "", class: "fa-solid fa-trash-can fa-lg delete-icon")
      end
    end
  end

  def edit_blog_link(blog)
    return unless current_user&.admin? # Only show if the user is an admin

    link_to(edit_blog_path(blog), class: 'text-decoration-none text-reset') do
      content_tag(:span, class: "mx-2") do
        content_tag(:i, "", class: "fa-regular fa-pen-to-square fa-lg edit-icon")
      end
    end
  end

  def like_blog_link(_blog, action: "likes#like")
    link_to("#", class: 'text-decoration-none text-reset', data: { action: action }) do
      content_tag(:span, id: "like", class: "mx-2") do
        content_tag(:i, "", class: "fa-regular fa-heart fa-lg likes-icon")
      end
    end
  end

  def blog_likes_count(blog)
    content_tag(:span, blog.likes, data: { likes_target: "count" })
  end
end
