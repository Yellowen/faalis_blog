Fabricator :post, class_name: 'Faalis::Blog::Post' do
  title 'category_1'
  raw_content '#test1'
  permalink 'category-1'
  members_only  false
  published false
  views 0
  likes 0
  dislikes 0
  allow_comments true
  user { Fabricate(:user, password: '123123',
                   password_confirmation: '123123') }
  category { Fabricate(:category) }
end
