module Faalis::Blog
  class Category < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::DomainAware

    has_many :posts
  end
end
