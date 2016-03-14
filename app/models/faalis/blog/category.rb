module Faalis::Blog
  class Category < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::DomainAware

    has_many :posts

    def name
      title
    end
  end
end
