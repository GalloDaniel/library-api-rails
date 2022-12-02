class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :gender, :publish_date, :publishing_company, :author_id
end
