class Book
  include Aws::Record

  string_attr :author, hash_key: true
  string_attr :name, range_key: true

  string_attr :publish_date
end