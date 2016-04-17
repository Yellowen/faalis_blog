require 'test_helper'

module Faalis::Blog
  class PostTest < ActiveSupport::TestCase

    @@subject = ::Faalis::Blog::Post

    before do
      @user     = Fabricate(:user, password: '111111',
                            password_confirmation: '111111')
      @category = Fabricate(:category)
    end

    test "won't save without a title" do

      subject = @@subject.new(permalink: 'post-1',
                              user: @user,
                              category: @category)

      result = subject.save

      assert_not result, msg: 'Post saved without a title.'
    end

    test "won't save without a permalink" do
      subject = @@subject.new(title: 'post-1', user: @user,
                              category: @category)

      result = subject.save

      assert_equal false, result, msg: 'post saved without a permalink.'
    end


    test "won't save without a user" do
      subject = @@subject.new(title: 'post-1', permalink: 'post-1',
                              category: @category)

      failed = false
      begin
        subject.save
      rescue Exception => e
        assert_equal ActiveRecord::StatementInvalid, e.class
        failed = true
      end

      assert failed, msg: 'Post should not save without a user'
    end

    test "won't save without a category" do
      subject = @@subject.new(title: 'post-1', permalink: 'post-1',
                              user: @user)

      failed = false
      begin
        subject.save
      rescue Exception => e
        assert_equal ActiveRecord::StatementInvalid, e.class
        failed = true
      end

      assert failed, msg: 'Post should not save without a user'
    end

    test '`published` returns published posts' do
      3.times do
        Fabricate(:post, published: true, category: @category,
                   user: @user)
      end
      Fabricate(:post, category: @category, user: @user)

      result = @@subject.published

      assert_equal 3, result.count
    end
  end
end
