# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  title      :string
#  post       :text
#  author     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class News < ApplicationRecord

  validates :title, presence: true
  validates :post, presence: true
  validates :author, presence: true

end
