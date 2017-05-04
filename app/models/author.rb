class Author
  include Aws::Record

  @table_name = "dota-core-author" # => 这样写是可以的

  string_attr :first_name, hash_key: true
  string_attr :last_name, range_key: true

  string_attr :publish_date


  def self.build_records  # => 单个创建对象
    author = Author.new(
      first_name: 'yi',
      last_name: 'duo',
      publish_date: '2017-01-10'
    )
    author.save

    author = Author.new(
      first_name: 'yi',
      last_name: 'duoduo',
      publish_date: '2017-01-10'
    )
    author.save

    author = Author.new(
      first_name: 'yu',
      last_name: 'ru',
      publish_date: '2017-01-10'
    )
    author.save

    author = Author.new(
      first_name: 'wang',
      last_name: 'yi',
      publish_date: '2017-01-10'
    )
    author.save
  end

  # 主键查找
  def self.find_yiduo # => 返回 Author 对象 & 并且 key 必须齐全 非常快
    author = Author.find_with_opts(
      key: {
        first_name: 'yi',
        last_name: 'duo'
      }
    )
  end

  # query
  def self.query_yiduo # => 返回 Aws::Record::ItemCollection 对象
    authors = Author.query({
      key_condition_expression: "#N = :n",
      filter_expression:  "#D >= :d",
      expression_attribute_names: {
        '#N' => 'first_name',
        '#D' => 'publish_date'
      },
      expression_attribute_values: {
        ':n' => 'yi',
        ':d' => '2017-01-09'
      }
    })
  end
end


