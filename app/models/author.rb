class Author < ApplicationRecord
  has_many :books
  validates :name, :age, :main_gender, presence: true

  def as_json(options={})
    super(root: true, include: :books )
  end

end
