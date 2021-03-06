require_relative '../../automated_init'

context "Get" do
  context "Batch" do
    context "Hash" do
      table = Controls::Table.name

      column_value = SecureRandom.hex(7)

      Controls::Table::Truncate.(table: table)

      id = Controls::Row::Put.(table: table, column_value: column_value)

      query = Controls::Query::Position.example

      messages = ViewData::Postgres::Get::Batch.(query: query, batch_size: 1)

      message = messages.first

      context "Got the message that was written" do
        test "ID" do
          assert(message["id"] == id)
        end

        test "Some Column" do
          assert(message["some_column"] == column_value)
        end
      end
    end
  end
end
