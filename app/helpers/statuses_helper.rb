module StatusesHelper
  def display_status_feed_item(status)
    description = link_to(content_tag(:strong, h(status.attempt.reagent.name)), status.attempt.reagent) + " is now at " + link_to(content_tag(:strong, h(status.step.name)), status.step) + tag(:br) + h(status.description)
    content_tag(:em, h(status.updated_at), :class => "pull-right", :time => 0) + content_tag(:div, description, :class => "feedText")
  end
end
