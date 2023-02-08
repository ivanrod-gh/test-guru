module TestsHelper
  def test_header(test)
    test.persisted? ? 'Редактировать тест' : 'Создать новый тест'
  end
end
