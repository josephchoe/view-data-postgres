require_relative '../automated_init'

context "Iterator" do
  context "Batch Initialization" do
    context "Batch is Nil" do
      iterator = ViewData::Postgres::Read::Iterator.build
      iterator.batch = nil

      test "Batch is not initialized" do
        refute(iterator.batch_initialized?)
      end
    end

    context "Batch is Not Nil" do
      iterator = ViewData::Postgres::Read::Iterator.build
      iterator.batch = :something

      test "Batch is initialized" do
        assert(iterator.batch_initialized?)
      end
    end
  end
end
