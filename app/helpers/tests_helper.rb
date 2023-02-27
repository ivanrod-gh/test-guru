module TestsHelper
  def test_header(test)
    test.persisted? ? I18n.t('.admin.tests.edit.header') : I18n.t('.admin.tests.new.header')
  end
end
