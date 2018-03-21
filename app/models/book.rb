class Book
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :published, type: Date
end
