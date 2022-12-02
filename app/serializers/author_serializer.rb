class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :main_gender, :age

  has_many :books

end
