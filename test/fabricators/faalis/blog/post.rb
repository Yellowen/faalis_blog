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
  category { Fabricate(:category) }
end
