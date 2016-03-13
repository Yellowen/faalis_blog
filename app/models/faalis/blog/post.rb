module Faalis::Blog
  class Post < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::DomainAware

    belongs_to :category
  end
end
