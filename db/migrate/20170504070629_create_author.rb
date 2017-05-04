class CreateAuthor < ActiveRecord::Migration[5.1]
  def change
    migration = Aws::Record::TableMigration.new(Author)
    migration.create!(
      provisioned_throughput: {
        read_capacity_units: 5,
        write_capacity_units: 2
      }
    )
    migration.wait_until_available
  end
end
