class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    # create_table :books do |t|

    #   t.timestamps
    # end

    migration = Aws::Record::TableMigration.new(Book)
    migration.create!(
      provisioned_throughput: {
        read_capacity_units: 5,
        write_capacity_units: 2
      }
    )
    migration.wait_until_available
  end
end
