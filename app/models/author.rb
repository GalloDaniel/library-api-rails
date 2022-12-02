class Author < ApplicationRecord
  has_many :books

  def as_json(options={})
    super(root: true, include: :books )
  end
end
