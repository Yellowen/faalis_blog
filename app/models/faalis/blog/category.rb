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

module Faalis::Blog
  class Category < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::DomainAware

    has_many :posts

    scope :published_posts, -> { posts.where(published: true) }

    validates_presence_of :title, :permalink

    def name
      title
    end
  end
end
