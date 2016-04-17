# == Schema Information
#
# Table name: faalis_blog_categories
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  permalink    :string
#  members_only :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  domain_id    :integer
#

require 'test_helper'

module Faalis::Blog
  class CategoryTest < ActiveSupport::TestCase


  end
end
