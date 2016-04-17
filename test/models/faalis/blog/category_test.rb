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

    @@subject = ::Faalis::Blog::Category

    test "won't save without a title" do
      subject = @@subject.new(permalink: 'category-1')

      result = subject.save

      assert_not result, msg: 'Category saved without a title.'
    end

    test "won't save without a permalink" do
      subject = @@subject.new(title: 'category-1')

      result = subject.save

      assert_not result, msg: 'Category saved without a title.'
    end

    describe 'published_posts' do
      test 'will return the published posts belongs to current category' do
        subject = Fabricate(:category)

        3.times { Fabricate(:post, category: subject, published: true) }
        Fabricate(:post, category: subject, published: false)

        result = subject.published_posts

        assert_equal 3, result.count
      end
    end
  end
end
