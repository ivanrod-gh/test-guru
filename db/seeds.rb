# frozen_string_literal: false

# Filling test DB with initial data
Category.create!(title: 'HTML')
Category.create!(title: 'Ruby')
Category.create!(title: 'Java')
Category.create!(title: 'JavaScript')
Category.create!(title: 'Викторины')

# Create users in case of environment
if Rails.env == 'production'
  User.create(
    first_name: 'admin',
    last_name: 'system',
    email: ENV['ADMIN_MAIL'],
    password: ENV['ADMIN_PASSWORD'],
    access_level: 'Admin'
  )
else
  rand(5..15).times do |i|
    user = User.new(
      email: "some#{i}@mail.net",
      password: '123456'
    )
    if rand(0..1).zero?
      user.first_name = Faker::Name.unique.male_first_name
      user.last_name = Faker::Name.unique.male_last_name
    else
      user.first_name = Faker::Name.unique.female_first_name
      user.last_name = Faker::Name.unique.female_last_name
    end
    user.access_level = 'Admin' if i < 3
    user.save!
  end
end

test_basic_html = Test.create!(
  title: 'Основы HTML',
  category: Category.find_by(title: 'HTML'),
  author: User.find_by(id: rand(1..User.count)),
  time: 25
)
test_basic_ruby = Test.create!(
  title: 'Основы Ruby',
  category: Category.find_by(title: 'Ruby'),
  author: User.find_by(id: rand(1..User.count)),
  time: 25
)
test_basic_java = Test.create!(
  title: 'Основы Java',
  category: Category.find_by(title: 'Java'),
  author: User.find_by(id: rand(1..User.count)),
  time: 25
)
test_basic_java_script = Test.create!(
  title: 'Основы JavaScript',
  category: Category.find_by(title: 'JavaScript'),
  author: User.find_by(id: rand(1..User.count)),
  time: 25
)
test_quiz_planets = Test.create!(
  title: 'Викторина: Планеты солнечной системы',
  category: Category.find_by(title: 'Викторины'),
  author: User.find_by(id: rand(1..User.count)),
  time: 15
)
test_quiz_yes_no = Test.create!(
  title: 'Викторина: Да/нет',
  category: Category.find_by(title: 'Викторины'),
  author: User.find_by(id: rand(1..User.count)),
  time: 15
)
test_quiz_animals = Test.create!(
  title: 'Викторина: Животные',
  category: Category.find_by(title: 'Викторины'),
  author: User.find_by(id: rand(1..User.count)),
  time: 15
)

# Basic HTML: questions/answers
current_test = test_basic_html
question = current_test.questions.new(
  body: 'О чем говорит тэг <p align="right"> … </p>?'
)
question.answers.new(
  body: 'Текст, заключенный в тэг, будет расположен по центру страницы'
)
question.answers.new(
  body: 'Текст, заключенный в тэг, будет расположен по левому краю страницы'
)
question.answers.new(
  body: 'Текст, заключенный в тэг, будет расположен по правому краю страницы',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Какие единицы измерения могут использоваться для атрибута ширины?'
)
question.answers.new(
  body: 'Пиксели и %',
  correct: true
)
question.answers.new(
  body: 'Миллиметры и сантиметры'
)
question.answers.new(
  body: 'Пиксели и миллиметры'
)
question.save!
question = current_test.questions.new(
  body: 'Использование тэга … позволяет добавлять одну строку текста без начала
  нового абзаца:'.gsub("\n ", '')
)
question.answers.new(
  body: '<line/>'
)
question.answers.new(
  body: '<br/>',
  correct: true
)
question.answers.new(
  body: '<td/>'
)
question.save!
question = current_test.questions.new(
  body: 'Объясните смысл кода, представленного ниже:
<table>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>'
)
question.answers.new(
  body: 'Будет создана таблица, состоящая из 1 ряда и 3 колонок',
  correct: true
)
question.answers.new(
  body: 'Будет создана таблица, состоящая из 3 рядов и 1 колонки'
)
question.answers.new(
  body: 'Будет создана таблица, состоящая из 2 рядов и 3 колонок'
)
question.save!
question = current_test.questions.new(
  body: 'Выберите код HTML, который бы создавал кнопку отправки заполненной формы.
  Имя кнопки – ОК'.gsub("\n ", '')
)
question.answers.new(
  body: '<input type="ОК" value="Submit"/>'
)
question.answers.new(
  body: '<p> input type="submit" value="OK" </p>'
)
question.answers.new(
  body: '<input type="submit" value="ОК"/>',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Какой тэг при создании страницы добавляет имя страницы, которое будет
  отображаться в строке заголовка в браузере пользователя?'.gsub("\n ", '')
)
question.answers.new(
  body: '<title> … </title>',
  correct: true
)
question.answers.new(
  body: '<header> … </header>'
)
question.answers.new(
  body: '<body> … </body>'
)
question.save!
question = current_test.questions.new(
  body: 'Заполните поля, чтобы отобразить картинку “flower.jpg” с высотой 300
  пикселей и шириной 750 пикселей:'.gsub("\n ", '')
)
question.answers.new(
  body: '<img ref=”flower” format=.jpg
high=300 px
width=750 px />'
)
question.answers.new(
  body: '<src img=”flower.jpg”
height=”300%”
width=”750%”/>'
)
question.answers.new(
  body: '<img src=”flower.jpg”
height=”300 px” alt=””
width=”750 px”/>',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Что содержит в себе атрибут href?'
)
question.answers.new(
  body: 'URL страницы, на которую произойдет перенаправление',
  correct: true
)
question.answers.new(
  body: 'Имя страницы, на которую произойдет перенаправление'
)
question.answers.new(
  body: 'Указание на то, где будет открываться новая страница: в том же или новом
  окне'.gsub("\n ", '')
)
question.save!
question = current_test.questions.new(
  body: 'Какие из перечисленных тэгов относятся к созданию таблицы?'
)
question.answers.new(
  body: '<header> <body> <footer>'
)
question.answers.new(
  body: '<table> <tr> <td>',
  correct: true
)
question.answers.new(
  body: '<ul> <li> <tr> <td>'
)
question.save!
question = current_test.questions.new(
  body: 'Укажите тэг, который соответствует элементу списка:'
)
question.answers.new(
  body: '<li>',
  correct: true
)
question.answers.new(
  body: '<ul>'
)
question.answers.new(
  body: '<ol>'
)
question.save!
question = current_test.questions.new(
  body: 'О чем говорит следующая запись: <form action="url" method="POST">?'
)
question.answers.new(
  body: 'Создается форма, при заполнении которой вводимые данные будут отображаться'
)
question.answers.new(
  body: 'Создается форма, при заполнении которой вводимые данные не будут отображаться',
  correct: true
)
question.answers.new(
  body: 'Создается форма, которая будет служить для внесения информации,
  представленной в виде ссылки (URL)'.gsub("\n ", '')
)
question.save!
question = current_test.questions.new(
  body: 'Какое значение следует задать атрибуту type, чтобы оно превращало входной
  тэг в форму отправки?'.gsub("\n ", '')
)
question.answers.new(
  body: 'Submit',
  correct: true
)
question.answers.new(
  body: 'Checkbox'
)
question.answers.new(
  body: 'Radiobutton'
)
question.save!
question = current_test.questions.new(
  body: 'Для задания размеров тэгу <frameset> требуются следующие атрибуты:'
)
question.answers.new(
  body: 'Высота и ширина'
)
question.answers.new(
  body: 'Площадь и толщина границ'
)
question.answers.new(
  body: 'Строки и столбцы',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Выберите верное утверждение:'
)
question.answers.new(
  body: 'В HTML цвета задаются комбинацией значений шестнадцатеричной системы
  исчисления: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, A, B, C, D, E, F'.gsub("\n ", ''),
  correct: true
)
question.answers.new(
  body: 'В HTML цвета задаются комбинацией значений двоичной системы исчисления: 0
  или 1'.gsub("\n ", '')
)
question.answers.new(
  body: 'В HTML цвета задаются комбинацией значений восьмеричной системы исчисления:
  0, 1, 2, 3, 4, 5, 6, 7'.gsub("\n ", '')
)
question.save!
question = current_test.questions.new(
  body: 'Какие тэги делают шрифт текста жирным?'
)
question.answers.new(
  body: '<ins> и <del>'
)
question.answers.new(
  body: '<li> и <ul>'
)
question.answers.new(
  body: '<b> и <strong>',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Какие тэги используются для определения заголовков?'
)
question.answers.new(
  body: 'h1-h6',
  correct: true
)
question.answers.new(
  body: 'Header'
)
question.answers.new(
  body: 'Heading'
)
question.save!
question = current_test.questions.new(
  body: 'Неотображаемые комментарии в HTML задаются следующим образом:'
)
question.answers.new(
  body: '<! - Your comment -!>'
)
question.answers.new(
  body: '<! - - Your comment - -!>',
  correct: true
)
question.answers.new(
  body: '<!p> Your comment </!p>'
)
question.save!
question = current_test.questions.new(
  body: 'Что означает следующий код:
<a href="http://www.sololern.com" target="_blank">
  Learn Playing
</a>'
)
question.answers.new(
  body: 'Переход по ссылке произойдет на новой странице',
  correct: true
)
question.answers.new(
  body: 'Переход по ссылке произойдет на текущей странице'
)
question.answers.new(
  body: 'На текущей странице появится текст «Learn Playing»'
)
question.save!
question = current_test.questions.new(
  body: 'Перечислите основные модули контента, существующие в HTML 5.'
)
question.answers.new(
  body: 'Image, Media, Metadata, Link, Heading, Color, Input Value'
)
question.answers.new(
  body: 'Metadata, Embedded, Interactive, Heading, Phrasing, Flow, Sectioning',
  correct: true
)
question.answers.new(
  body: 'Flow, Static, Link, Header, Body, Footer, Processing, Chase'
)
question.save!
question = current_test.questions.new(
  body: 'Укажите, какой элемент HTML 5 отвечает за воспроизведение видео:'
)
question.answers.new(
  body: '<video>',
  correct: true
)
question.answers.new(
  body: '<media>'
)
question.answers.new(
  body: '<movie>'
)
question.save!
question = current_test.questions.new(
  body: 'Элемент <canvas> используется для:'
)
question.answers.new(
  body: 'Прикрепления таблиц Excel'
)
question.answers.new(
  body: 'Управления данными в базе данных'
)
question.answers.new(
  body: 'Прорисовки графики',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Какой тэг содержит навигацию?'
)
question.answers.new(
  body: '<nav>',
  correct: true
)
question.answers.new(
  body: '<geo>'
)
question.answers.new(
  body: '<metanav>'
)
question.save!
question = current_test.questions.new(
  body: 'SessionStorage – это клиентское решение в HTML 5, которое позволяет:'
)
question.answers.new(
  body: 'Извлекать и использовать данные предыдущих сессий при условии того, что не
  были очищены cash и cookie'.gsub("\n ", '')
)
question.answers.new(
  body: 'Создавать базу данных решений пользователей в памяти браузера'
)
question.answers.new(
  body: 'Извлекать и использовать данные только текущей сессии',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Что создастся при исполнении следующего кода:
<svg width="75" height="75">
<line x1="50" y1="0" x2="50" y2="100"
style="stroke:black" />
<line x1="0" y1="50" x2="100" y2="50"
style="stroke:black" />
</svg> ?'
)
question.answers.new(
  body: 'Знак «плюс»',
  correct: true
)
question.answers.new(
  body: 'Знак «минус»'
)
question.answers.new(
  body: 'Знак «равно»'
)
question.save!
question = current_test.questions.new(
  body: 'Функция HTML 5 navigation.geolocation.getCurrentPosition() возвращает:'
)
question.answers.new(
  body: 'Встроенную в основной функционал сайта карту мира'
)
question.answers.new(
  body: 'Данные о местонахождении пользователя',
  correct: true
)
question.answers.new(
  body: 'Данные о местонахождении сервера'
)
question.save!
question = current_test.questions.new(
  body: 'Заполните пропуски таким образом, чтобы получился валидный HTML документ.
  «First paragraph» - комментарий.
<___>
<body>
<! - - First paragraph ___>
<___> This is the first paragraph! </p>
<___>
</html>'.gsub("\n ", '')
)
question.answers.new(
  body: 'html/; - - ?; p; /body'
)
question.answers.new(
  body: 'html v.5; - - !; /p; /body'
)
question.answers.new(
  body: 'html; - - !; p; /body',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'HTML – это'
)
question.answers.new(
  body: 'Язык разметки',
  correct: true
)
question.answers.new(
  body: 'Библиотека гипертекста'
)
question.answers.new(
  body: 'Скриптовый язык'
)
question.save!
question = current_test.questions.new(
  body: 'Обязательно ли использование тэгов <html> … </html>?'
)
question.answers.new(
  body: 'Да, без них браузер не распознает HTML-документ',
  correct: true
)
question.answers.new(
  body: 'Да, если HTML-документ создается в блокноте или другом текстовом редакторе.
  В специальном компиляторе HTML эти тэги можно не использовать'.gsub("\n ", '')
)
question.answers.new(
  body: 'Не обязательно'
)
question.save!
question = current_test.questions.new(
  body: 'Какой атрибут позволяет объединить ячейки таблицы по вертикали?'
)
question.answers.new(
  body: 'Union'
)
question.answers.new(
  body: 'Colspan'
)
question.answers.new(
  body: 'Rowspan',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Допустимое число заголовков первого уровня в HTML-документе составляет:'
)
question.answers.new(
  body: '1',
  correct: true
)
question.answers.new(
  body: '3'
)
question.answers.new(
  body: '7'
)
question.save!
question = current_test.questions.new(
  body: 'Текст, выделенный курсивом, представлен в следующей записи:'
)
question.answers.new(
  body: '<del> курсив </del>'
)
question.answers.new(
  body: '<i> курсив </i>',
  correct: true
)
question.answers.new(
  body: '<hr> курсив </hr>'
)
question.save!
question = current_test.questions.new(
  body: 'В HTML не существует … тэгов:'
)
question.answers.new(
  body: 'Одиночных'
)
question.answers.new(
  body: 'Парных'
)
question.answers.new(
  body: 'Тройных',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'При создании сайтов используют кодировку:'
)
question.answers.new(
  body: 'UTF8',
  correct: true
)
question.answers.new(
  body: 'ASCII'
)
question.answers.new(
  body: 'UTF-32'
)
question.save!
question = current_test.questions.new(
  body: 'HTML-документ может иметь расширения:'
)
question.answers.new(
  body: '.html'
)
question.answers.new(
  body: '.html или .htm',
  correct: true
)
question.answers.new(
  body: '.html или .txt'
)
question.save!
question = current_test.questions.new(
  body: 'Укажите устаревшие тэги для HTML 5:'
)
question.answers.new(
  body: '<applet>, <blink>, <u>',
  correct: true
)
question.answers.new(
  body: '<ul>, <audio>, <pre>'
)
question.answers.new(
  body: '<code>, <s>, <embed>'
)
question.save!
question = current_test.questions.new(
  body: 'Тэг, подключающий к существующему HTML-документу скрипты, которые
  выполняются на клиентской стороне – это:'.gsub("\n ", '')
)
question.answers.new(
  body: '<object>'
)
question.answers.new(
  body: '<script>',
  correct: true
)
question.answers.new(
  body: '<client>'
)
question.save!
question = current_test.questions.new(
  body: 'Какой символ обозначает конец тэга?'
)
question.answers.new(
  body: '^'
)
question.answers.new(
  body: ';'
)
question.answers.new(
  body: '/',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Список, в котором элементы перечисления отмечаются буллетами, позволяет
  создать тэг:'.gsub("\n ", '')
)
question.answers.new(
  body: '<ul>',
  correct: true
)
question.answers.new(
  body: '<ol>'
)
question.answers.new(
  body: '<bl>'
)
question.save!
question = current_test.questions.new(
  body: 'Укажите корректную запись для создания чек-бокса:'
)
question.answers.new(
  body: '<input checkbox>'
)
question.answers.new(
  body: '<type input=”checkbox”>'
)
question.answers.new(
  body: '<input type=”checkbox”>',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Укажите корректную запись для создания выпадающего списка:'
)
question.answers.new(
  body: '<input type=”dropdown”>',
  correct: true
)
question.answers.new(
  body: '<input dropdown list>'
)
question.answers.new(
  body: '<dropdown list>'
)
question.save!
question = current_test.questions.new(
  body: 'Какой атрибут HTML указывает альтернативный текст для изображения, если
  данное изображение не отобразится?'.gsub("\n ", '')
)
question.answers.new(
  body: 'imgalt'
)
question.answers.new(
  body: 'imgvar'
)
question.answers.new(
  body: 'alt',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Какой HTML-тэг используется для определения футера документа или раздела?'
)
question.answers.new(
  body: '<footer>',
  correct: true
)
question.answers.new(
  body: '<bottom>'
)
question.answers.new(
  body: '<section>'
)
question.save!
question = current_test.questions.new(
  body: 'HTML-тэг, позволяющий воспроизводить аудиозаписи – это:'
)
question.answers.new(
  body: '<music>'
)
question.answers.new(
  body: '<audio>',
  correct: true
)
question.answers.new(
  body: '<sound>'
)
question.save!
question = current_test.questions.new(
  body: 'В HTML 5, onblur и onfocus – это:'
)
question.answers.new(
  body: 'Атрибуты событий',
  correct: true
)
question.answers.new(
  body: 'Атрибуты стиля'
)
question.answers.new(
  body: 'Атрибуты подключения базы данных'
)
question.save!
question = current_test.questions.new(
  body: 'Графика, определенная SVG, отображается в формате:'
)
question.answers.new(
  body: 'CSS'
)
question.answers.new(
  body: 'JSOM'
)
question.answers.new(
  body: 'XML',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Что определяет тэг <aside>?'
)
question.answers.new(
  body: 'Дополнительное содержимое, т.е. то, что не включает основной документ',
  correct: true
)
question.answers.new(
  body: 'Ссылку на подключенный документ'
)
question.answers.new(
  body: 'Цветовое решение документа'
)
question.save!

# Basic Ruby: questions/answers
current_test = test_basic_ruby
question = current_test.questions.new(
  body: 'Где записана сокращенная форма кода ниже:
x = x / 3'
)
question.answers.new(
  body: 'x /= 3 ',
  correct: true
)
question.answers.new(
  body: 'Нет сокращенной формы'
)
question.answers.new(
  body: 'x = / 3'
)
question.save!
question = current_test.questions.new(
  body: 'Чем отличается puts от print:'
)
question.answers.new(
  body: 'Ничем, оба делают одно и тоже'
)
question.answers.new(
  body: 'print без пропуска строки, а puts с пропуском ',
  correct: true
)
question.answers.new(
  body: 'puts позволяет выводить переменные, а print только текст'
)
question.save!
question = current_test.questions.new(
  body: 'Какой метод позволяет перевести строку в нижний регистр:'
)
question.answers.new(
  body: 'lowercase()'
)
question.answers.new(
  body: 'dcase()'
)
question.answers.new(
  body: 'downcase()',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Что выведет этот код:
some = 25
print(“Переменная: ” + some)'
)
question.answers.new(
  body: 'Выведет: “Переменная: some”'
)
question.answers.new(
  body: 'Выведет: “Переменная: 25”'
)
question.answers.new(
  body: 'Будет выведена ошибка',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Где указана пустая переменная (без какого-либо значения):'
)
question.answers.new(
  body: 'some = 0'
)
question.answers.new(
  body: 'some = nil',
  correct: true
)
question.answers.new(
  body: 'some = “”'
)
question.save!
question = current_test.questions.new(
  body: 'В каком варианте вы получите число без пропуска строки от пользователя:'
)
question.answers.new(
  body: 'num = gets'
)
question.answers.new(
  body: 'num = gets.chomp()'
)
question.answers.new(
  body: 'um = gets.chomp().to_i ',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Как называется самый популярный фреймворк Ruby для веба:'
)
question.answers.new(
  body: 'Ruby On Rails',
  correct: true
)
question.answers.new(
  body: 'Ruby Web'
)
question.answers.new(
  body: 'Ruby Framework'
)
question.save!
question = current_test.questions.new(
  body: 'Что покажет этот код:
num = -6
num *= 2
num = num. abs()
res = Math. sqrt(num * 12)
print(“Результат: ” + res. round(). to_s)'
)
question.answers.new(
  body: 'Выведет: Ошибку'
)
question.answers.new(
  body: 'Выведет: “Результат: -12”'
)
question.answers.new(
  body: 'Выведет: “Результат: 12”',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Сработает ли данный код:
print(“Введите имя: “)
name = gets
puts(“Имя: ” + name)'
)
question.answers.new(
  body: 'Необходимо дописать gets.chomp()'
)
question.answers.new(
  body: 'Код сработает в любом случае',
  correct: true
)
question.answers.new(
  body: 'Код сработает только если введут строку, а не число'
)
question.save!
question = current_test.questions.new(
  body: 'Динамический, рефлективный, интерпретируемый высокоуровневый язык
  программирования:'.gsub("\n ", '')
)
question.answers.new(
  body: 'Ruby',
  correct: true
)
question.answers.new(
  body: 'Dylan'
)
question.answers.new(
  body: 'Scala'
)
question.save!
question = current_test.questions.new(
  body: 'Язык обладает независимой от операционной системы реализацией:'
)
question.answers.new(
  body: 'одноточности'
)
question.answers.new(
  body: 'многопоточности',
  correct: true
)
question.answers.new(
  body: 'релевантности'
)
question.save!
question = current_test.questions.new(
  body: 'По особенностям синтаксиса он близок к языку:'
)
question.answers.new(
  body: 'Perl',
  correct: true
)
question.answers.new(
  body: 'Dylan'
)
question.answers.new(
  body: 'Scala'
)
question.save!
question = current_test.questions.new(
  body: 'По объектно-ориентированному подходу близок к:'
)
question.answers.new(
  body: 'Smalltalk',
  correct: true
)
question.answers.new(
  body: 'Scala'
)
question.answers.new(
  body: 'Dylan'
)
question.save!
question = current_test.questions.new(
  body: 'Некоторые черты языка взяты из:'
)
question.answers.new(
  body: 'Perl'
)
question.answers.new(
  body: 'Scala'
)
question.answers.new(
  body: 'Lisp',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Создатель Ruby:'
)
question.answers.new(
  body: 'Билл Гейтц'
)
question.answers.new(
  body: 'Марк Цукербург'
)
question.answers.new(
  body: 'Юкихиро Мацумото (Matz)',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'В Японии Ruby стал популярным с момента появления первой общедоступной
  версии в:'.gsub("\n ", '')
)
question.answers.new(
  body: '2005 году'
)
question.answers.new(
  body: '1995 году ',
  correct: true
)
question.answers.new(
  body: '1999 году'
)
question.save!
question = current_test.questions.new(
  body: 'Ruby – полностью такой язык:'
)
question.answers.new(
  body: 'Специфический'
)
question.answers.new(
  body: 'Объектно-ориентированный',
  correct: true
)
question.answers.new(
  body: 'Ориентировочно-последовательный'
)
question.save!
question = current_test.questions.new(
  body: 'Ruby использует вызов по соиспользованию (call-by-sharing), хотя в
  сообществе Ruby часто говорят, что он использует вызов по:'.gsub("\n ", '')
)
question.answers.new(
  body: 'Вычислению'
)
question.answers.new(
  body: 'Памяти'
)
question.answers.new(
  body: 'Ссылке',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Ruby не поддерживает множественное наследование, но вместо него есть мощный
  механизм:'.gsub("\n ", '')
)
question.answers.new(
  body: 'Фактов'
)
question.answers.new(
  body: 'Примесей',
  correct: true
)
question.answers.new(
  body: 'Тем'
)
question.save!
question = current_test.questions.new(
  body: 'Ruby является таким языком:'
)
question.answers.new(
  body: 'максипарадигменным'
)
question.answers.new(
  body: 'парадигменным'
)
question.answers.new(
  body: 'мультипарадигменным',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Ruby поддерживает такой стиль:'
)
question.answers.new(
  body: 'динамический'
)
question.answers.new(
  body: 'процедурный',
  correct: true
)
question.answers.new(
  body: 'процессуальный'
)
question.save!
question = current_test.questions.new(
  body: 'Ruby позволяет обрабатывать исключения в стиле:'
)
question.answers.new(
  body: 'Java',
  correct: true
)
question.answers.new(
  body: 'Perl'
)
question.answers.new(
  body: 'Eiffel'
)
question.save!
question = current_test.questions.new(
  body: 'Ruby позволяет переопределять операторы, которые на самом деле являются:'
)
question.answers.new(
  body: 'методами',
  correct: true
)
question.answers.new(
  body: 'способами'
)
question.answers.new(
  body: 'данными'
)
question.save!
question = current_test.questions.new(
  body: 'Ruby может динамически загружать расширения, если это позволяет:'
)
question.answers.new(
  body: 'память'
)
question.answers.new(
  body: 'операционная система',
  correct: true
)
question.answers.new(
  body: 'интернет'
)
question.save!

# Basic Java: questions/answers
current_test = test_basic_java
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a + 2);
}'
)
question.answers.new(
  body: '52'
)
question.answers.new(
  body: '7',
  correct: true
)
question.answers.new(
  body: '5+2'
)
question.answers.new(
  body: 'unhandled exception '
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a + "2");
}'
)
question.answers.new(
  body: '52',
  correct: true
)
question.answers.new(
  body: '7'
)
question.answers.new(
  body: '5+2'
)
question.answers.new(
  body: 'unhandled exception '
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a / 2);
}'
)
question.answers.new(
  body: '2',
  correct: true
)
question.answers.new(
  body: '1'
)
question.answers.new(
  body: '2.5'
)
question.answers.new(
  body: 'unhandled exception'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a / 2.0);
}'
)
question.answers.new(
  body: '2'
)
question.answers.new(
  body: '1'
)
question.answers.new(
  body: '2.5',
  correct: true
)
question.answers.new(
  body: 'unhandled exception'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a % 2);
}'
)
question.answers.new(
  body: '2'
)
question.answers.new(
  body: '1',
  correct: true
)
question.answers.new(
  body: '2.5'
)
question.answers.new(
  body: 'unhandled exception'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
double a = 5;
System.out.println(a / 2);
}'
)
question.answers.new(
  body: '2'
)
question.answers.new(
  body: '1'
)
question.answers.new(
  body: '2.5',
  correct: true
)
question.answers.new(
  body: 'unhandled exception'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
double a = 5;
System.out.println((int) a / 2);
}'
)
question.answers.new(
  body: '2',
  correct: true
)
question.answers.new(
  body: '1'
)
question.answers.new(
  body: '2.5'
)
question.answers.new(
  body: 'unhandled exception'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{11, 5, -4, 8, 4, 7};
for (int i = 0; i < array.length; i += 2) {
System.out.print(array[i]+" ");
}
}'
)
question.answers.new(
  body: '11 -4 4',
  correct: true
)
question.answers.new(
  body: '0 2 4'
)
question.answers.new(
  body: 'ArrayIndexOutOfBoundsException'
)
question.answers.new(
  body: '11'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{11, 5, -4, 8, 4, 7};
for (int i = 0; i < array.length; i += 2) {
System.out.print(i+" ");
}
}'
)
question.answers.new(
  body: '11 -4 4'
)
question.answers.new(
  body: '0 2 4',
  correct: true
)
question.answers.new(
  body: 'ArrayIndexOutOfBoundsException'
)
question.answers.new(
  body: '11'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{11, 5, -4, 8, 4, 7};
for (int i = 0; i <= array.length; i += 2) {
System.out.print(array[i] + " ");
}
}'
)
question.answers.new(
  body: '11 -4 4'
)
question.answers.new(
  body: '0 2 4'
)
question.answers.new(
  body: 'ArrayIndexOutOfBoundsException',
  correct: true
)
question.answers.new(
  body: '11'
)
question.save!
question = current_test.questions.new(
  body: 'Что выполняет данный код?
public static void main(String[] args) {
int z = 0;
int number = 452;
while (number > 0) {
z += number % 10;
number /= 10;
}
System.out.println(z);
}'
)
question.answers.new(
  body: 'выводит на консоль сумму цифр числа',
  correct: true
)
question.answers.new(
  body: 'выводит на консоль количество цифр числа'
)
question.answers.new(
  body: 'выводит на консоль сумму остатков от деления на 10 всех цифр числа'
)
question.answers.new(
  body: 'выводит на консоль число в обратном порядке'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int x = -2, y = 5, z;
z = x > y ? x : y;
System.out.println(z);
}'
)
question.answers.new(
  body: '-2'
)
question.answers.new(
  body: '5',
  correct: true
)
question.answers.new(
  body: '3'
)
question.answers.new(
  body: '7'
)
question.save!
question = current_test.questions.new(
  body: 'Дан код:
public static void main(String[] args) {
int x = -2, y = 5, max;
// добавьте код
System.out.println(max);
}
Какой из предложенных ниже фрагментов кода выведет на консоль максимальное число?'
)
question.answers.new(
  body: 'max = x < y ? x : y;'
)
question.answers.new(
  body: 'max = x > y ? x : y;',
  correct: true
)
question.answers.new(
  body: 'if (x > y) max = x; else max = y;',
  correct: true
)
question.answers.new(
  body: 'if (x < y) max = x; else max = y;'
)
question.save!
question = current_test.questions.new(
  body: '--х; это:'
)
question.answers.new(
  body: 'постфиксный инкремент'
)
question.answers.new(
  body: 'префиксный инкремент'
)
question.answers.new(
  body: 'постфиксный декремент'
)
question.answers.new(
  body: 'префиксный декремент',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Что из нижеперечисленного является примитивным типом данных?'
)
question.answers.new(
  body: 'int[]'
)
question.answers.new(
  body: 'int',
  correct: true
)
question.answers.new(
  body: 'char',
  correct: true
)
question.answers.new(
  body: 'Boolean'
)
# question.answers.new(
#   body: 'Integer'
# )
# question.answers.new(
#   body: 'String'
# )
question.save!
question = current_test.questions.new(
  body: 'Как указать индекс последнего элемента массива?'
)
question.answers.new(
  body: 'array.length;'
)
question.answers.new(
  body: 'array.size;'
)
question.answers.new(
  body: 'array.length-1;',
  correct: true
)
question.answers.new(
  body: 'array.size-1;'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{15, 5, -8, -6, 0, 7};
System.out.println(array[array.length - 1]);
}'
)
question.answers.new(
  body: '0'
)
question.answers.new(
  body: '7',
  correct: true
)
question.answers.new(
  body: '6'
)
question.answers.new(
  body: '5'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[3];
System.out.println(array[2]);
}'
)
question.answers.new(
  body: '0',
  correct: true
)
question.answers.new(
  body: '1'
)
# question.answers.new(
#   body: '2'
# )
question.answers.new(
  body: 'ArrayIndexOutOfBoundsException'
)
question.answers.new(
  body: 'null'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String[] array = new String[3];
System.out.println(array[2]);
}'
)
question.answers.new(
  body: '0'
)
question.answers.new(
  body: '1'
)
# question.answers.new(
#   body: '2'
# )
question.answers.new(
  body: 'ArrayIndexOutOfBoundsException'
)
question.answers.new(
  body: 'null',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Выберите правильный вариант записи операции сравнения?'
)
question.answers.new(
  body: '0<=x;',
  correct: true
)
question.answers.new(
  body: 'x>=0;',
  correct: true
)
question.answers.new(
  body: 'x=>0;'
)
question.answers.new(
  body: '0=<x;'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String s = "Hello";
System.out.println(s + 5 + 4);
}'
)
question.answers.new(
  body: 'Hello54',
  correct: true
)
question.answers.new(
  body: 'Hello9'
)
question.answers.new(
  body: 'Hello 5 4'
)
question.answers.new(
  body: 'Hello 54'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String s = "Hello";
System.out.println(s + (5 + 4));
}'
)
question.answers.new(
  body: 'Hello54'
)
question.answers.new(
  body: 'Hello9',
  correct: true
)
question.answers.new(
  body: 'Hello 5 4'
)
question.answers.new(
  body: 'Hello 54'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
System.out.println(1.0 / 0);
}'
)
question.answers.new(
  body: 'Infinity',
  correct: true
)
question.answers.new(
  body: 'NAN'
)
question.answers.new(
  body: 'ArithmeticException: / by zero'
)
question.answers.new(
  body: 'не позволит запустить код на выполнение'
)
question.save!
question = current_test.questions.new(
  body: 'Какой модификатор доступа необходимо использовать, чтобы переменная была
  видна только в текущем классе?'.gsub("\n ", '')
)
question.answers.new(
  body: 'public'
)
question.answers.new(
  body: 'private',
  correct: true
)
question.answers.new(
  body: 'protected'
)
question.answers.new(
  body: 'default (package visible) '
)
question.save!
question = current_test.questions.new(
  body: 'Какой модификатор доступа необходимо использовать, чтобы переменная была
  видна везде?'.gsub("\n ", '')
)
question.answers.new(
  body: 'public',
  correct: true
)
question.answers.new(
  body: 'private'
)
question.answers.new(
  body: 'protected'
)
question.answers.new(
  body: 'default (package visible) '
)
question.save!
question = current_test.questions.new(
  body: 'Дан следующий код:
public static void main(String[] args) {
int z = 15;
// добавьте код
{
System.out.println(z);
z--;
}
}
Необходимо вывести на консоль все числа от 0 до 15. Выберите правильный вариант
решения.'.gsub("\n ", '')
)
question.answers.new(
  body: 'while ((z >= 0) && (z <= 15))',
  correct: true
)
question.answers.new(
  body: 'while ((z >= 0) & (z <= 15))'
)
question.answers.new(
  body: 'while ((z >= 0) || (z <= 15))'
)
# question.answers.new(
#   body: 'while ((z >= 0) != (z <= 15))'
# )
# question.answers.new(
#   body: 'while ((z >= 0) == (z <= 15))'
# )
question.answers.new(
  body: 'while ((z >= 0) == (z <= 15))'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int x = 125_121_148;
System.out.println(++x);
}'
)
question.answers.new(
  body: 'ошибка на этапе компиляции'
)
question.answers.new(
  body: 'ошибка во время выполнения'
)
question.answers.new(
  body: '125121149',
  correct: true
)
question.answers.new(
  body: '125121148'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String test = "Hello";
String test2 = "Hello";
System.out.println(test==test2);
}'
)
question.answers.new(
  body: 'true',
  correct: true
)
question.answers.new(
  body: 'false'
)
question.answers.new(
  body: 'Hello'
)
question.answers.new(
  body: 'null'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String test = new String("Hello");
String test2 = new String("Hello");
System.out.println(test==test2);
}'
)
question.answers.new(
  body: 'true'
)
question.answers.new(
  body: 'false',
  correct: true
)
question.answers.new(
  body: 'Hello'
)
question.answers.new(
  body: 'null'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного фрагмента кода?
for(;;) {
}'
)
question.answers.new(
  body: 'бесконечный цикл',
  correct: true
)
question.answers.new(
  body: 'ошибка на этапе компиляции'
)
question.answers.new(
  body: 'ошибка на этапе выполнения'
)
question.answers.new(
  body: 'этот код никогда не выполнится'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int sum = 0;
for (int i = 1; i <= 3; sum += i++) ;
System.out.println(sum);
}'
)
question.answers.new(
  body: '6',
  correct: true
)
question.answers.new(
  body: '3'
)
question.answers.new(
  body: 'compile error'
)
question.answers.new(
  body: '5'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
byte x = 127;
x += 2;
System.out.println(x);
}'
)
question.answers.new(
  body: '-127',
  correct: true
)
question.answers.new(
  body: '129'
)
question.answers.new(
  body: 'runtime error'
)
question.answers.new(
  body: 'compile error'
)
question.save!
question = current_test.questions.new(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
byte x = -128;
x -= 2;
System.out.println(x);
}'
)
question.answers.new(
  body: '126',
  correct: true
)
question.answers.new(
  body: '-130'
)
question.answers.new(
  body: '2'
)
question.answers.new(
  body: 'compile error'
)
question.save!
question = current_test.questions.new(
  body: 'Какие из следующих объявлений переменных верны?'
)
question.answers.new(
  body: 'int 1x;'
)
question.answers.new(
  body: 'double t; int x;'
)
# question.answers.new(
#   body: 'int f,f;'
# )
# question.answers.new(
#   body: 'int x,X; double a; a1;'
# )
# question.answers.new(
#   body: 'String book1; book2;'
# )
question.answers.new(
  body: 'char symbol1,symbol2,symbol_3;',
  correct: true
)
# question.answers.new(
#   body: 'int x,a,b; double y,z,x;'
# )
question.answers.new(
  body: 'int x; double X;',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Выберите вариант объявления массива в стиле Java:'
)
question.answers.new(
  body: 'String [] birthdays = new String[10];',
  correct: true
)
question.answers.new(
  body: 'String birthdays [] = new String[10];'
)
question.answers.new(
  body: 'String birthdays [] = String[10];'
)
question.answers.new(
  body: 'String birthdays = String[];'
)
question.save!

# Basic Java Script: questions/answers
current_test = test_basic_java_script
question = current_test.questions.new(
  body: 'Какую функцию нужно использовать, чтобы пользователь мог ввести свой текст
  (ответ) в окошке?'.gsub("\n ", '')
)
question.answers.new(
  body: 'print'
)
question.answers.new(
  body: 'prompt',
  correct: true
)
question.answers.new(
  body: 'confirm'
)
question.answers.new(
  body: 'setTimeout'
)
question.save!
question = current_test.questions.new(
  body: 'Какую функцию нужно использовать, чтобы вывести на экран текст в окошке?'
)
question.answers.new(
  body: 'setInterval'
)
question.answers.new(
  body: 'history'
)
question.answers.new(
  body: 'alert',
  correct: true
)
question.answers.new(
  body: 'open'
)
question.save!
question = current_test.questions.new(
  body: 'Что в строке ниже?
var a;'
)
question.answers.new(
  body: 'функция'
)
question.answers.new(
  body: 'переменная',
  correct: true
)
question.answers.new(
  body: 'команда'
)
question.answers.new(
  body: 'оператор'
)
question.save!
question = current_test.questions.new(
  body: 'В какой строке ошибка?'
)
question.answers.new(
  body: 'var a;'
)
question.answers.new(
  body: 'var a = 3;'
)
question.answers.new(
  body: 'var = 3;',
  correct: true
)
question.answers.new(
  body: 'a = 3;'
)
question.save!
question = current_test.questions.new(
  body: 'Для чего нужна строка?
var username = prompt("Ваше имя");'
)
question.answers.new(
  body: 'Создать переменную и записать в неё имя, которое вводит пользователь',
  correct: true
)
question.answers.new(
  body: 'Вывести имя пользователя на экран'
)
question.answers.new(
  body: 'Создать пустую переменную'
)
question.answers.new(
  body: 'Спросить у пользователя его имя'
)
question.save!
question = current_test.questions.new(
  body: 'С помощью какого оператора можно найти остаток от деления?'
)
question.answers.new(
  body: '**'
)
question.answers.new(
  body: '%',
  correct: true
)
question.answers.new(
  body: '--'
)
question.answers.new(
  body: '?'
)
question.save!
question = current_test.questions.new(
  body: 'Какой оператор прибавляет к числу единицу?'
)
question.answers.new(
  body: '--'
)
question.answers.new(
  body: '++',
  correct: true
)
question.answers.new(
  body: '&&'
)
question.answers.new(
  body: '||'
)
question.save!
question = current_test.questions.new(
  body: 'Как преобразовать введённую строку в число?'
)
question.answers.new(
  body: 'var a = Number(prompt("Введите число"))',
  correct: true
)
question.answers.new(
  body: 'var a = (Number)(prompt("Введите число"))'
)
question.answers.new(
  body: 'var a = (Number)prompt("Введите число")'
)
question.answers.new(
  body: 'var a = prompt("Введите число")'
)
question.save!
question = current_test.questions.new(
  body: 'Какой оператор определит, равны ли две переменные?'
)
question.answers.new(
  body: '<'
)
question.answers.new(
  body: '>'
)
# question.answers.new(
#   body: '='
# )
question.answers.new(
  body: '<='
)
# question.answers.new(
#   body: '>='
# )
question.answers.new(
  body: '==',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Какой оператор поможет определить, что две переменные НЕ равны друг другу?'
)
question.answers.new(
  body: '<'
)
# question.answers.new(
#   body: '>'
# )
question.answers.new(
  body: '!=',
  correct: true
)
question.answers.new(
  body: '<='
)
question.answers.new(
  body: '>='
)
# question.answers.new(
#   body: '=='
# )
question.save!
question = current_test.questions.new(
  body: 'С какого слова начинается условие?'
)
question.answers.new(
  body: 'else'
)
# question.answers.new(
#   body: 'loop'
# )
question.answers.new(
  body: 'if',
  correct: true
)
question.answers.new(
  body: 'then'
)
# question.answers.new(
#   body: 'begin'
# )
# question.answers.new(
#   body: 'function'
# )
question.answers.new(
  body: 'for'
)
question.save!
question = current_test.questions.new(
  body: 'Пользователь вводит два числа, нужно определить какое из них больше. В каком
  варианте задача решена верно?'.gsub("\n ", '')
)
question.answers.new(
  body: 'var a = Number(prompt("Число 1: "));
var b= Number(prompt("Число 2: "));
if (a>b)
alert ("Наибольшее: "+a);
else alert ("Наибольшее: "+b);',
  correct: true
)
question.answers.new(
  body: 'var a = prompt("Число 1: ");
var b= prompt("Число 2: ");
if (a>b)
alert ("Наибольшее: "+a);
else alert ("Наибольшее: "+b);'
)
question.answers.new(
  body: 'Number(prompt("Число 1: "));
Number(prompt("Число 2: "));
if (a>b)
alert ("Наибольшее: "+a);
else alert ("Наибольшее: "+b);'
)
question.answers.new(
  body: 'var a = Number(prompt("Число 1: "));
var b= Number(prompt("Число 2: "));
if (a>b)
alert ("Наибольшее: "+a);'
)
question.save!
question = current_test.questions.new(
  body: 'В каких вариантах при создании условия допущена ошибка?'
)
question.answers.new(
  body: 'if (a > b)
alert(“Наибольшее ” + a);'
)
# question.answers.new(
#   body: 'if (a < b)
# alert(“Наименьшее ” + a);
# else alert(“Наименьшее ” + b);'
# )
question.answers.new(
  body: 'if (a==b)
{
alert(“Числа равны”);
с = a + b;
}'
)
question.answers.new(
  body: '(a > b)
alert(“Наибольшее ” + a);',
  correct: true
)
question.answers.new(
  body: 'if a > b
alert(“Наибольшее ” + a);',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'С какого слова начинается цикл?'
)
# question.answers.new(
#   body: 'else'
# )
question.answers.new(
  body: 'loop'
)
question.answers.new(
  body: 'if'
)
question.answers.new(
  body: 'then'
)
# question.answers.new(
#   body: 'begin'
# )
# question.answers.new(
#   body: 'function'
# )
question.answers.new(
  body: 'for',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'В каком варианте цикл создан верно?'
)
question.answers.new(
  body: 'for (var i = 0; i < 10; i++) {
alert(“Цифра ” + i);
}',
  correct: true
)
question.answers.new(
  body: 'for (i = 0; i < 10; i++) {
alert(“Цифра ” + i);
}'
)
question.answers.new(
  body: 'for (var i == 0; i < 10; i++) {
alert(“Цифра ” + i);
}'
)
question.answers.new(
  body: 'for var i = 0; i < 10; i++ {
alert(“Цифра ” + i);
}'
)
question.save!
question = current_test.questions.new(
  body: 'Какие бывают циклы в JavaScript? Отметьте все правильные варианты.'
)
question.answers.new(
  body: 'for',
  correct: true
)
question.answers.new(
  body: 'while',
  correct: true
)
# question.answers.new(
#   body: 'do...while',
#   correct: true
# )
# question.answers.new(
#   body: 'let'
# )
question.answers.new(
  body: 'if'
)
question.answers.new(
  body: 'var'
)
question.save!
question = current_test.questions.new(
  body: 'Что такое массив?'
)
question.answers.new(
  body: 'спископодобный элемент',
  correct: true
)
question.answers.new(
  body: 'переменная'
)
question.answers.new(
  body: 'свойство'
)
question.save!
question = current_test.questions.new(
  body: 'Что выполняется во второй строке кода?
var animals = [‘кошка’, ’собака’, ‘хомяк’];
animals.push(‘попугай’);'
)
question.answers.new(
  body: 'удаление элемента в конце массива'
)
question.answers.new(
  body: 'добавление элемента в конец массива',
  correct: true
)
question.answers.new(
  body: 'добавление элемента в начало массива'
)
question.save!
question = current_test.questions.new(
  body: 'Что выполняется во второй строке кода?
var animals = [‘кошка’, ’собака’, ‘хомяк’];
animals.pop();'
)
question.answers.new(
  body: 'удаление элемента в конце массива',
  correct: true
)
question.answers.new(
  body: 'добавление элемента в конец массива'
)
question.answers.new(
  body: 'удаление элемента в начале массива'
)
question.save!
question = current_test.questions.new(
  body: 'С какого слова начинается функция?'
)
question.answers.new(
  body: 'else'
)
# question.answers.new(
#   body: 'loop'
# )
question.answers.new(
  body: 'if'
)
# question.answers.new(
#   body: 'then'
# )
question.answers.new(
  body: 'begin'
)
question.answers.new(
  body: 'function',
  correct: true
)
# question.answers.new(
#   body: 'for'
# )
question.save!
question = current_test.questions.new(
  body: 'В какой строке происходит вызов функции perimeter?
Введите порядковый номер этой строки.
function perimeter (side) {
x = side * 4;
return x;
}
side = prompt(‘Введите сторону квадрата: ’);
p = perimeter(side);
alert(‘Периметр квадрата: ’ + p);'
)
question.answers.new(
  body: '2'
)
question.answers.new(
  body: '3'
)
question.answers.new(
  body: '6',
  correct: true
)
question.answers.new(
  body: '9'
)
question.save!
question = current_test.questions.new(
  body: 'В каком варианте функция создана без ошибок?'
)
question.answers.new(
  body: 'function square (side) {
x = side * side;
return x;
}',
  correct: true
)
question.answers.new(
  body: 'function (side) {
x = side * side;
return x;
}'
)
question.answers.new(
  body: 'function square (side)
x = side * side;
return x;'
)
question.answers.new(
  body: 'function square {
x = side * side;
return x;
}'
)
question.save!
question = current_test.questions.new(
  body: 'Для чего нужна функция getElementById()?'
)
question.answers.new(
  body: 'ввод текста'
)
question.answers.new(
  body: 'поиск элемента в HTML по его ID',
  correct: true
)
question.answers.new(
  body: 'добавление элемента в массив'
)
question.answers.new(
  body: 'поиск текста'
)
question.save!
question = current_test.questions.new(
  body: 'Что делает строка ниже?
document.getElementById(“p1”).innerHTML = “Привет!”;'
)
question.answers.new(
  body: 'ищет элемент в HTML'
)
question.answers.new(
  body: 'ищет элемент в HTML и удаляет в нём текст'
)
question.answers.new(
  body: 'удаляет элемент в HTML'
)
question.answers.new(
  body: 'ищет элемент в HTML и меняет в нём текст',
  correct: true
)
question.save!

# Quiz: Planets: questions/answers
current_test = test_quiz_planets
question = current_test.questions.new(
  body: 'Сколько спутников у Марса?',
  answer_explanation: 'У Марса два спутника: Фобос и Деймос.'
)
question.answers.new(
  body: '13'
)
question.answers.new(
  body: '2',
  correct: true
)
question.answers.new(
  body: '50'
)
question.answers.new(
  body: '1'
)
question.save!
question = current_test.questions.new(
  body: 'Самый большой вулкан Солнечной системы называется «Гора Олимп». Где он
  находится?'.gsub("\n ", ''),
  answer_explanation: 'Гора Олимп, крупнейший вулкан Солнечной системы находится на
  Марсе. Высота вулкана — 26 км от основания, диаметр — около 540 км.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Юпитер'
)
question.answers.new(
  body: 'Земля'
)
question.answers.new(
  body: 'Венера'
)
question.answers.new(
  body: 'Марс',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Какая планета ближе всех расположена к Солнцу?',
  answer_explanation: 'Меркурий — ближайшая к Солнцу планета.'
)
question.answers.new(
  body: 'Земля'
)
question.answers.new(
  body: 'Венера'
)
question.answers.new(
  body: 'Меркурий',
  correct: true
)
question.answers.new(
  body: 'Нептун'
)
question.save!
question = current_test.questions.new(
  body: 'Большое красное пятно на Юпитере, что это?',
  answer_explanation: 'Большое красное пятно — это сильная буря в атмосфере Юпитера.'
)
question.answers.new(
  body: 'вулкан'
)
question.answers.new(
  body: 'озеро'
)
question.answers.new(
  body: 'буря',
  correct: true
)
question.answers.new(
  body: 'кратер'
)
question.save!
question = current_test.questions.new(
  body: 'Из чего в основном состоит Солнце?',
  answer_explanation: 'Солнце в основном состоит из двух газов: водорода и гелия.'
)
question.answers.new(
  body: 'жидкая лава'
)
question.answers.new(
  body: 'расплавленный метал'
)
question.answers.new(
  body: 'газ',
  correct: true
)
question.answers.new(
  body: 'камень'
)
question.save!
question = current_test.questions.new(
  body: 'Из чего в основном состоят кометы?',
  answer_explanation: 'Кометы в основном состоят из льда и пыли.'
)
question.answers.new(
  body: 'ядовитая жидкость'
)
question.answers.new(
  body: 'лед и пыль',
  correct: true
)
question.answers.new(
  body: 'ржавый металл'
)
question.answers.new(
  body: 'расплавленный камень'
)
question.save!
question = current_test.questions.new(
  body: 'К какой планете принадлежат спутники Оберон и Титания?',
  answer_explanation: 'Оберон и Титания — два из 27 спутников Урана.'
)
question.answers.new(
  body: 'Юпитер'
)
question.answers.new(
  body: 'Уран',
  correct: true
)
question.answers.new(
  body: 'Венера'
)
question.answers.new(
  body: 'Земля'
)
question.save!
question = current_test.questions.new(
  body: 'Какой из вариантов лучше всего описывает атмосферу, окружающую Венеру?',
  answer_explanation: 'Венера окружена кислотными облаками, а ее средняя температура
  на поверхности может достигать 735 К (462 °C). Поэтому самое подходящее описание
  атмосферы Венеры — горячая и ядовитая.'.gsub("\n ", '')
)
question.answers.new(
  body: 'яркая и солнечная'
)
question.answers.new(
  body: 'холодная и снежная'
)
question.answers.new(
  body: 'холодная и влажная'
)
question.answers.new(
  body: 'горячая и ядовитая',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Где находится пояс астероидов?',
  answer_explanation: 'Пояс астероидов находится в области между планетами Марс и
  Юпитер.'.gsub("\n ", '')
)
question.answers.new(
  body: 'между Юпитером и Сатурном'
)
question.answers.new(
  body: 'Землей и Венерой'
)
question.answers.new(
  body: 'Марсом и Юпитером',
  correct: true
)
question.answers.new(
  body: 'Землей и Марсом'
)
question.save!
question = current_test.questions.new(
  body: 'Какая из этих планет самая маленькая?',
  answer_explanation: 'Меркурий, его ширина составляет 4879 км.'
)
question.answers.new(
  body: 'Юпитер'
)
question.answers.new(
  body: 'Уран'
)
question.answers.new(
  body: 'Земля'
)
question.answers.new(
  body: 'Меркурий',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Какие две планеты вращаются в обратном направлении от остальных?',
  answer_explanation: 'Уран и Венера'
)
question.answers.new(
  body: 'Уран и Венера',
  correct: true
)
question.answers.new(
  body: 'Венера и Плутон'
)
question.answers.new(
  body: 'Меркурий и Юпитер'
)
question.answers.new(
  body: 'Земля и Нептун'
)
question.save!

# Quiz: Yes/No: questions/answers
current_test = test_quiz_yes_no
question = current_test.questions.new(
  body: 'Быки реагируют на красный цвет?',
  answer_explanation: 'Быки практически не различают цветов. В корриде они реагируют
  не на красный, а на раздражающее размахивание плащом.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Страусы от опасности прячут голову в песок?',
  answer_explanation: 'Страусы, когда чувствуют опасность, убегают. Миф о том, что
  они закапываются, возник, возможно, из-за того, что, обессилев от долгой погони,
  они просто роняют голову со своей длинной шеей.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Бананы растут на пальмах?',
  answer_explanation: 'Банановое растение — это гигантская трава. А сами бананы —
  ягоды.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Эйнштейн был двоечником?',
  answer_explanation: 'Эйнштейн учился не отлично, но хорошо. Единственная низкая
  оценка в его аттестате — тройка по французскому.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Летучие мыши слепые?',
  answer_explanation: 'У летучих мышей вполне нормальное зрение. Они совмещают его
  возможности с эхолокацией.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Молния не может ударить дважды в одно и то же место?',
  answer_explanation: 'Молния способна ударить в одно место не два и даже не три раза.
  В некоторые здания она бьет до ста раз в год.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Площадь суши России больше, чем у Плутона?',
  answer_explanation: 'Площадь суши России — 17 млн км2. Это больше, чем у Плутона
  (16,6 млн  км2).'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да',
  correct: true
)
question.answers.new(
  body: 'Нет'
)
question.save!
question = current_test.questions.new(
  body: 'Верблюды накапливают в горбах воду?',
  answer_explanation: 'Верблюды накапливают в горбах не воду, а жир.'
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Если взять в руку лягушку — появится бородавка?',
  answer_explanation: 'Бородавки могут появиться на руках от вируса папилломы человека.
  Но не лягушки.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Нервные клетки не восстанавливаются?',
  answer_explanation: 'В мозге постоянно происходит процесс нейрогенеза — образования
  новых нервных клеток из клеток-предшественниц. С возрастом процесс замедляется.
  Но все же идет!'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Великая Китайская стена — единственный рукотворный объект на Земле, видимый
  из космоса?'.gsub("\n ", ''),
  answer_explanation: 'С низкой орбиты можно увидеть отнюдь не только Великую
  Китайскую стену. Египетские пирамиды, например, видно ничуть не хуже.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Да'
)
question.answers.new(
  body: 'Нет',
  correct: true
)
question.save!

# Quiz: Animals: questions/answers
current_test = test_quiz_animals
question = current_test.questions.new(
  body: 'Какая кошка самая большая на планете?',
  answer_explanation: 'Крупнейший подвид животного обитает в Сибири и достигает веса
  свыше 300 кг. При этом другие кошки тоже заслуживают особого внимания: рычание
  льва заставляет содрогаться всю саванну в окрестностях 5 километров, а гепард
  находится в Книге рекордов Гиннесса как самое быстрое млекопитающее.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Лев'
)
question.answers.new(
  body: 'Тигр',
  correct: true
)
question.answers.new(
  body: 'Гепард'
)
question.answers.new(
  body: 'Барс'
)
question.save!
question = current_test.questions.new(
  body: 'Какое сухопутное животное может открыть рот максимально широко?',
  answer_explanation: 'У бегемота огромный рот, который открывается на 150 градусов
  и 1 м в высоту. Внутри челюстей расположены массивные зубы длиной около 45 см.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Аллигатор'
)
question.answers.new(
  body: 'Крокодил'
)
question.answers.new(
  body: 'Бабуин'
)
question.answers.new(
  body: 'Бегемот',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Какое животное самое крупное на Земле?',
  answer_explanation: 'Африканский слон относится к крупнейшим наземным обитателям,
  но самым крупным животным на планете считается синий кит. Его вес может достигать
  200 тонн, что сопоставимо с массой 33 слонов.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Африканский слон'
)
question.answers.new(
  body: 'Синий кит',
  correct: true
)
question.answers.new(
  body: 'Кашалот'
)
question.answers.new(
  body: 'Гигантский кальмар'
)
question.save!
question = current_test.questions.new(
  body: 'Какое млекопитающее умеет летать?',
  answer_explanation: 'Белка-летяга и колуго (еще его называют «летающим лемуром»)
  только прыгают с одного дерева на другое, а белоголовый орлан относится к птицам,
  а не к млекопитающим. Поэтому единственный правильный ответ – летучая мышь.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Летучая мышь',
  correct: true
)
question.answers.new(
  body: 'Белка-летяга'
)
question.answers.new(
  body: 'Белоголовый орлан'
)
question.answers.new(
  body: 'Колуго'
)
question.save!
question = current_test.questions.new(
  body: 'Как называется животное, которое употребляет в пищу растения и мясо?',
  answer_explanation: 'Плотоядные особи употребляют мясо, травоядные – только
  растительную пищу, а всеядные – и те, и другие продукты. Под пескатарианством
  подразумевается поедание овощей и рыбы.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Плотоядное животное'
)
question.answers.new(
  body: 'Травоядное животное'
)
question.answers.new(
  body: 'Всеядное животное',
  correct: true
)
question.answers.new(
  body: 'Пескатариан'
)
question.save!
question = current_test.questions.new(
  body: 'Почему каланы («морские выдры») держатся за руки?',
  answer_explanation: 'Подобное явление относится к самым зрелищным и очаровательным
  в мире природы – животные держатся вместе в плавучих группах, которые называются
  «плотами», и часто связывают лапы, словно держатся за руки. Такой подход позволяет
  им поддерживать тесный телесный контакт и не уплывать далеко от семьи.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Потому что они любят друг друга'
)
question.answers.new(
  body: 'Чтобы показать, что они в одной семье'
)
question.answers.new(
  body: 'Чтобы они не уплывали, когда спят',
  correct: true
)
question.answers.new(
  body: 'Потому что они играют'
)
question.save!
question = current_test.questions.new(
  body: 'Как отличить насекомое от паука?',
  answer_explanation: 'Несмотря на массу сходств с другими ползучими насекомыми,
  пауки не являются насекомыми. Они принадлежат к классу паукообразных, которые
  сами употребляют в пищу насекомых.'.gsub("\n ", '')
)
question.answers.new(
  body: 'У насекомых три части тела, у пауков – две'
)
question.answers.new(
  body: 'У насекомых шесть ног, у пауков – восемь'
)
question.answers.new(
  body: 'У насекомых могут быть крылья, у пауков они отсутствуют'
)
question.answers.new(
  body: 'Все вышеперечисленные факты',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Чем утконос отличается от других млекопитающих?',
  answer_explanation: 'Утконос является одним из двух млекопитающих, которые
  откладывают яйца. Еще один вид – ехидна, или колючий муравьед, напоминающий
  дикобраза. Животные обитают в Австралии и практически не эволюционируют с
  доисторических времен. Утконос проводит яйцекладку в своей норе, а у ехидны
  для яиц есть сумка.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Крякает, как утка'
)
question.answers.new(
  body: 'Откладывает яйца ',
  correct: true
)
question.answers.new(
  body: 'Строит гнезда'
)
question.answers.new(
  body: 'Ковыляет'
)
question.save!
question = current_test.questions.new(
  body: 'Почему змеи высовывают язык?',
  answer_explanation: 'Змеи высовывают язык, чтобы получить химические данные из
  окружающей среды и передать их обратно к двум рецепторам на нёбе. Это объясняет,
  почему у змей раздвоенный язык.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Чтобы напугать хищников'
)
question.answers.new(
  body: 'Чтобы облизать добычу'
)
question.answers.new(
  body: 'Чтобы издать шипящий звук'
)
question.answers.new(
  body: 'Чтобы «понюхать» воздух',
  correct: true
)
question.save!
question = current_test.questions.new(
  body: 'Как называется явление, обозначающее, что на Земле не осталось ни одного
  животного конкретного вида?'.gsub("\n ", ''),
  answer_explanation: 'Самыми яркими представителями группы вымерших животных
  являются динозавры.'.gsub("\n ", '')
)
question.answers.new(
  body: 'Эволюция'
)
question.answers.new(
  body: 'Сохранение'
)
question.answers.new(
  body: 'Вымирание',
  correct: true
)
question.answers.new(
  body: 'Находящиеся под угрозой исчезновения'
)
question.save!

# Gererate randomized additional initial data in case of environment
if Rails.env != 'production'
  Category.all.count.times do |db_category_id|
    3.times do |i|
      rand(1..3).times do |j|
        test_level = i + 1
        Test.create!(
          title: "Болванка [#{Category.find(db_category_id + 1).title}] уровень #{i + 1} номер #{j + 1}",
          category: Category.find_by(id: db_category_id + 1),
          author: User.find_by(id: rand(1..User.count)),
          level: test_level,
          time: 20
        )
      end
    end
  end

  Test.where("title LIKE 'Болванка%'").each do |db_test|
    rand(5..15).times do
      question = db_test.questions.new(
        body: Faker::Markdown.emphasis
      )
      question_answer_count = rand(2..4)
      correct_answer = rand(1..question_answer_count)
      question_answer_count.times do |i|
        question.answers.new(
          body: "#{'(true)' if i + 1 == correct_answer} #{Faker::Book.title}",
          correct: i + 1 == correct_answer
        )
      end
      question.save!
    end
  end

  zero_activity_user_chance = rand(20..50)
  User.all.each do |user|
    next if rand(0..99) < zero_activity_user_chance

    user_test_start_chance = rand(30..70)
    Test.count.times do |i|
      next unless rand(0..99) < user_test_start_chance

      TestPassage.create!(user: user, test: Test.find_by(id: i + 1))
    end
  end
end

# Publish all the Tests
Test.all.each do |test|
  test.calculate_test_passable
end

# Add badge requirements
BadgeRequirement.create!(
  description: 'Тест пройден с первой попытки'
)
BadgeRequirement.create!(
  description: 'Тест пройден на 100%'
)
BadgeRequirement.create!(
  description: 'Пройдены все тесты определенной категории'
)
BadgeRequirement.create!(
  description: 'Пройден определенный % от всех тестов'
)

# Add badges
Badge.create!(
  title: "Тест 'Основы HTML' пройден с первой попытки",
  picture: "/badge/first_html_basic.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 1),
  requirement_data: 1
)
Badge.create!(
  title: "Тест 'Основы Ruby' пройден с первой попытки",
  picture: "/badge/first_ruby_basic.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 1),
  requirement_data: 2
)
Badge.create!(
  title: "Тест 'Основы Java' пройден с первой попытки",
  picture: "/badge/first_java_basic.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 1),
  requirement_data: 3
)
Badge.create!(
  title: "Тест 'Основы JavaScript' пройден с первой попытки",
  picture: "/badge/first_javascript_basic.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 1),
  requirement_data: 4
)
Badge.create!(
  title: "Викторина 'Планеты солнечной системы' пройдена с первой попытки",
  picture: "/badge/first_quiz_solar.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 1),
  requirement_data: 5
)
Badge.create!(
  title: "Викторина 'Да/нет' пройдена с первой попытки",
  picture: "/badge/first_quiz_yesno.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 1),
  requirement_data: 6
)
Badge.create!(
  title: "Викторина 'Животные' пройдена с первой попытки",
  picture: "/badge/first_quiz_animals.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 1),
  requirement_data: 7
)
Badge.create!(
  title: "Пройдены 'Основы HTML' на 100%",
  picture: "/badge/100_html_basic.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 2),
  requirement_data: 1
)
Badge.create!(
  title: "Пройдены 'Основы Ruby' на 100%",
  picture: "/badge/100_ruby_basic.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 2),
  requirement_data: 2
)
Badge.create!(
  title: "Пройдены 'Основы Java' на 100%",
  picture: "/badge/100_java_basic.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 2),
  requirement_data: 3
)
Badge.create!(
  title: "Пройдены 'Основы JavaScript' на 100%",
  picture: "/badge/100_javascript_basic.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 2),
  requirement_data: 4
)
Badge.create!(
  title: "Пройдена 'Викторина: Планеты солнечной системы' на 100%",
  picture: "/badge/100_quiz_solar.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 2),
  requirement_data: 5
)
Badge.create!(
  title: "Пройдена 'Викторина: Да/нет' на 100%",
  picture: "/badge/100_quiz_yesno.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 2),
  requirement_data: 6
)
Badge.create!(
  title: "Пройдена 'Викторина: Животные' на 100%",
  picture: "/badge/100_quiz_animals.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 2),
  requirement_data: 7
)
Badge.create!(
  title: "Пройдены все тесты категории 'HTML'",
  picture: "/badge/all_html.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 3),
  requirement_data: 1
)
Badge.create!(
  title: "Пройдены все тесты категории 'Ruby'",
  picture: "/badge/all_ruby.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 3),
  requirement_data: 2
)
Badge.create!(
  title: "Пройдены все тесты категории 'Java'",
  picture: "/badge/all_java.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 3),
  requirement_data: 3
)
Badge.create!(
  title: "Пройдены все тесты категории 'JavaScript'",
  picture: "/badge/all_javascript.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 3),
  requirement_data: 4
)
Badge.create!(
  title: "Пройдены все викторины",
  picture: "/badge/all_quiz.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 3),
  requirement_data: 5
)
Badge.create!(
  title: "Пройдена половина тестов!",
  picture: "/badge/site_50.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 4),
  requirement_data: 50
)
Badge.create!(
  title: "Пройдены все тесты!",
  picture: "/badge/site_100.png",
  author: User.find_by(id: rand(1..User.count)),
  requirement: BadgeRequirement.find_by(id: 4),
  requirement_data: 100
)

# def show_users
#   puts "All users stats:"
#   User.all.each do |user|
#     puts "#{'=' * 10}\nid: #{user.id}\nname: #{user.name}"
#     user.author_tests.length.zero? ? (puts '-no written tests-') : (puts "written tests: #{user.author_tests.inspect}")
#     user.passed_tests.length.zero? ? (puts '-no passed tests-') : (puts "passed tests: #{user.passed_tests.inspect}")
#     puts "created_at: #{user.created_at}\nupdated_at: #{user.updated_at}"
#   end
# end

# show_users
