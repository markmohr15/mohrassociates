# == Schema Information
#
# Table name: web_contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  phone      :string
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WebContact < ApplicationRecord

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :comment, presence: true

end
