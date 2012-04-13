class ActiveSupport::TimeWithZone

  include ActionView::Helpers::DateHelper

  def words_ago
    words = time_ago_in_words self, true
    "#{ words } ago"
  end

end
