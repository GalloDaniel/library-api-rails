class Book < ApplicationRecord
  belongs_to :author
  validates :title, :description, :gender, :author_id, :publish_date, :publishing_company, presence: true

end
