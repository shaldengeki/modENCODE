module UsersHelper
  def admin?(user)
    user.role == "admin"
  end
  def admin?
    current_user.role == "admin"
  end
end
