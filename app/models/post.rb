# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  author     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  published  :boolean          default(FALSE)
#

class Post < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true

  before_save :update_slug

  def preview
    ActionView::Base.full_sanitizer.sanitize(self.content).split(" ").first(50).join(" ") + "..."
  end

  def to_param
    slug
  end

  def update_slug
    self.slug = title.downcase.gsub(" ", "-")
  end

end
