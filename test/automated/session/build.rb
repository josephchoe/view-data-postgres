require_relative '../automated_init'

context "Session" do
  context "Build" do
    context "Settings is specified" do
      settings = ViewData::Postgres::Settings.build

      session = ViewData::Postgres::Session.build(settings: settings)

      test "Specified settings is used" do
        assert(session.user == settings.get(:user))
      end
    end

    context "Settings is not specified" do
      settings = ViewData::Postgres::Settings.build

      session = ViewData::Postgres::Session.build

      test "Settings is built" do
        assert(session.user == settings.get(:user))
      end
    end
  end
end
