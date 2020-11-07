require_relative '../../../automated_init'

context "Iterator" do
  context "Batch Depletion" do
    context "Depleted" do
      context "Batch Index is the Batch Length" do
        iterator = ViewData::Postgres::Read::Iterator.build

        iterator.batch = [1, 11]
        iterator.batch_index = 2

        batch_depleted = iterator.batch_depleted?

        test "Batch is depleted" do
          assert(batch_depleted)
        end
      end
    end
  end
end
