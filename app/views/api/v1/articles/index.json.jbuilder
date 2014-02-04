json.array! @articles do |article|
  json.extract! article, :id, :title, :content, :publish, :meta_title, :meta_desc
end
