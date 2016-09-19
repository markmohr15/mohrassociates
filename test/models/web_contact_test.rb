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

require 'test_helper'

class WebContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
