# rubocop:disable all
include ApplicationHelper
# rubocop:enable all
def is_logged_in?
  !session[:user_id].nil?
end
