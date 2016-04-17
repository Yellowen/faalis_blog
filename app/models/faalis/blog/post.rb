# == Schema Information
#
# Table name: faalis_blog_posts
#
#  id               :integer          not null, primary key
#  title            :string
#  permalink        :string
#  raw_content      :text
#  content          :text
#  category_id      :integer          not null
#  published        :boolean
#  user_id          :integer          not null
#  views            :integer          default(0)
#  likes            :integer          default(0)
#  dislikes         :integer          default(0)
#  allow_comments   :boolean          default(TRUE)
#  members_only     :boolean          default(FALSE)
#  meta_title       :string
#  meta_description :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  domain_id        :integer
#

module Faalis::Blog
  class Post < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::DomainAware
    belongs_to :user, class_name: 'Faalis::User'
    belongs_to :category
  end
end
