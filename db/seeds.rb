# frozen_string_literal: false

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Filling test DB with initial data
# NO VALIDATION
Category.create(title: 'HTML')
Category.create(title: 'Ruby')
Category.create(title: 'Java')
Category.create(title: 'JavaScript')
Category.create(title: 'Викторины')

rand(5..15).times { User.create(name: Faker::Name.name) }

Test.create(
  title: 'Основы HTML',
  category: Category.find_by(title: 'HTML'),
  author: User.find_by(id: rand(1..User.count))
)
Test.create(
  title: 'Основы Ruby',
  category: Category.find_by(title: 'Ruby'),
  author: User.find_by(id: rand(1..User.count))
)
Test.create(
  title: 'Основы Java',
  category: Category.find_by(title: 'Java'),
  author: User.find_by(id: rand(1..User.count))
)
Test.create(
  title: 'Основы JavaScript',
  category: Category.find_by(title: 'JavaScript'),
  author: User.find_by(id: rand(1..User.count))
)
Test.create(
  title: 'Викторина: Планеты солнечной системы',
  category: Category.find_by(title: 'Викторины'),
  author: User.find_by(id: rand(1..User.count))
)
Test.create(
  title: 'Викторина: Да/нет',
  category: Category.find_by(title: 'Викторины'),
  author: User.find_by(id: rand(1..User.count))
)
Test.create(
  title: 'Викторина: Животные',
  category: Category.find_by(title: 'Викторины'),
  author: User.find_by(id: rand(1..User.count))
)

# Basic HTML: questions/answers
html_basic_test = Test.find_by(title: 'Основы HTML')
html_basic_test.questions.create(
  body: 'О чем говорит тэг <p align="right"> … </p>?'
)
html_basic_test.questions.last.answers.create(
  body: 'Текст, заключенный в тэг, будет расположен по центру страницы'
)
html_basic_test.questions.last.answers.create(
  body: 'Текст, заключенный в тэг, будет расположен по левому краю страницы'
)
html_basic_test.questions.last.answers.create(
  body: 'Текст, заключенный в тэг, будет расположен по правому краю страницы',
  correct: true
)
html_basic_test.questions.create(
  body: 'Какие единицы измерения могут использоваться для атрибута ширины?'
)
html_basic_test.questions.last.answers.create(
  body: 'Пиксели и %',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Миллиметры и сантиметры'
)
html_basic_test.questions.last.answers.create(
  body: 'Пиксели и миллиметры'
)
html_basic_test.questions.create(
  body: 'Использование тэга … позволяет добавлять одну строку текста без начала
  нового абзаца:'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: '<line/>'
)
html_basic_test.questions.last.answers.create(
  body: '<br/>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<td/>'
)
html_basic_test.questions.create(
  body: 'Объясните смысл кода, представленного ниже:
<table>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>'
)
html_basic_test.questions.last.answers.create(
  body: 'Будет создана таблица, состоящая из 1 ряда и 3 колонок',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Будет создана таблица, состоящая из 3 рядов и 1 колонки'
)
html_basic_test.questions.last.answers.create(
  body: 'Будет создана таблица, состоящая из 2 рядов и 3 колонок'
)
html_basic_test.questions.create(
  body: 'Выберите код HTML, который бы создавал кнопку отправки заполненной формы.
  Имя кнопки – ОК'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: '<input type="ОК" value="Submit"/>'
)
html_basic_test.questions.last.answers.create(
  body: '<p> input type="submit" value="OK" </p>'
)
html_basic_test.questions.last.answers.create(
  body: '<input type="submit" value="ОК"/>',
  correct: true
)
html_basic_test.questions.create(
  body: 'Какой тэг при создании страницы добавляет имя страницы, которое будет
  отображаться в строке заголовка в браузере пользователя?'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: '<title> … </title>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<header> … </header>'
)
html_basic_test.questions.last.answers.create(
  body: '<body> … </body>'
)
html_basic_test.questions.create(
  body: 'Заполните поля, чтобы отобразить картинку “flower.jpg” с высотой 300
  пикселей и шириной 750 пикселей:'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: '<img ref=”flower” format=.jpg
high=300 px
width=750 px />'
)
html_basic_test.questions.last.answers.create(
  body: '<src img=”flower.jpg”
height=”300%”
width=”750%”/>'
)
html_basic_test.questions.last.answers.create(
  body: '<img src=”flower.jpg”
height=”300 px” alt=””
width=”750 px”/>',
  correct: true
)
html_basic_test.questions.create(
  body: 'Что содержит в себе атрибут href?'
)
html_basic_test.questions.last.answers.create(
  body: 'URL страницы, на которую произойдет перенаправление',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Имя страницы, на которую произойдет перенаправление'
)
html_basic_test.questions.last.answers.create(
  body: 'Указание на то, где будет открываться новая страница: в том же или новом
  окне'.gsub("\n ", '')
)
html_basic_test.questions.create(
  body: 'Какие из перечисленных тэгов относятся к созданию таблицы?'
)
html_basic_test.questions.last.answers.create(
  body: '<header> <body> <footer>'
)
html_basic_test.questions.last.answers.create(
  body: '<table> <tr> <td>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<ul> <li> <tr> <td>'
)
html_basic_test.questions.create(
  body: 'Укажите тэг, который соответствует элементу списка:'
)
html_basic_test.questions.last.answers.create(
  body: '<li>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<ul>'
)
html_basic_test.questions.last.answers.create(
  body: '<ol>'
)
html_basic_test.questions.create(
  body: 'О чем говорит следующая запись: <form action="url" method="POST">?'
)
html_basic_test.questions.last.answers.create(
  body: 'Создается форма, при заполнении которой вводимые данные будут отображаться'
)
html_basic_test.questions.last.answers.create(
  body: 'Создается форма, при заполнении которой вводимые данные не будут отображаться',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Создается форма, которая будет служить для внесения информации,
  представленной в виде ссылки (URL)'.gsub("\n ", '')
)
html_basic_test.questions.create(
  body: 'Какое значение следует задать атрибуту type, чтобы оно превращало входной
  тэг в форму отправки?'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: 'Submit',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Checkbox'
)
html_basic_test.questions.last.answers.create(
  body: 'Radiobutton'
)
html_basic_test.questions.create(
  body: 'Для задания размеров тэгу <frameset> требуются следующие атрибуты:'
)
html_basic_test.questions.last.answers.create(
  body: 'Высота и ширина'
)
html_basic_test.questions.last.answers.create(
  body: 'Площадь и толщина границ'
)
html_basic_test.questions.last.answers.create(
  body: 'Строки и столбцы',
  correct: true
)
html_basic_test.questions.create(
  body: 'Выберите верное утверждение:'
)
html_basic_test.questions.last.answers.create(
  body: 'В HTML цвета задаются комбинацией значений шестнадцатеричной системы
  исчисления: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, A, B, C, D, E, F'.gsub("\n ", ''),
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'В HTML цвета задаются комбинацией значений двоичной системы исчисления: 0
  или 1'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: 'В HTML цвета задаются комбинацией значений восьмеричной системы исчисления:
  0, 1, 2, 3, 4, 5, 6, 7'.gsub("\n ", '')
)
html_basic_test.questions.create(
  body: 'Какие тэги делают шрифт текста жирным?'
)
html_basic_test.questions.last.answers.create(
  body: '<ins> и <del>'
)
html_basic_test.questions.last.answers.create(
  body: '<li> и <ul>'
)
html_basic_test.questions.last.answers.create(
  body: '<b> и <strong>',
  correct: true
)
html_basic_test.questions.create(
  body: 'Какие тэги используются для определения заголовков?'
)
html_basic_test.questions.last.answers.create(
  body: 'h1-h6',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Header'
)
html_basic_test.questions.last.answers.create(
  body: 'Heading'
)
html_basic_test.questions.create(
  body: 'Неотображаемые комментарии в HTML задаются следующим образом:'
)
html_basic_test.questions.last.answers.create(
  body: '<! - Your comment -!>'
)
html_basic_test.questions.last.answers.create(
  body: '<! - - Your comment - -!>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<!p> Your comment </!p>'
)
html_basic_test.questions.create(
  body: 'Что означает следующий код:
<a href="http://www.sololern.com" target="_blank">
  Learn Playing
</a>'
)
html_basic_test.questions.last.answers.create(
  body: 'Переход по ссылке произойдет на новой странице',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Переход по ссылке произойдет на текущей странице'
)
html_basic_test.questions.last.answers.create(
  body: 'На текущей странице появится текст «Learn Playing»'
)
html_basic_test.questions.create(
  body: 'Перечислите основные модули контента, существующие в HTML 5.'
)
html_basic_test.questions.last.answers.create(
  body: 'Image, Media, Metadata, Link, Heading, Color, Input Value'
)
html_basic_test.questions.last.answers.create(
  body: 'Metadata, Embedded, Interactive, Heading, Phrasing, Flow, Sectioning',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Flow, Static, Link, Header, Body, Footer, Processing, Chase'
)
html_basic_test.questions.create(
  body: 'Укажите, какой элемент HTML 5 отвечает за воспроизведение видео:'
)
html_basic_test.questions.last.answers.create(
  body: '<video>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<media>'
)
html_basic_test.questions.last.answers.create(
  body: '<movie>'
)
html_basic_test.questions.create(
  body: 'Элемент <canvas> используется для:'
)
html_basic_test.questions.last.answers.create(
  body: 'Прикрепления таблиц Excel'
)
html_basic_test.questions.last.answers.create(
  body: 'Управления данными в базе данных'
)
html_basic_test.questions.last.answers.create(
  body: 'Прорисовки графики',
  correct: true
)
html_basic_test.questions.create(
  body: 'Какой тэг содержит навигацию?'
)
html_basic_test.questions.last.answers.create(
  body: '<nav>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<geo>'
)
html_basic_test.questions.last.answers.create(
  body: '<metanav>'
)
html_basic_test.questions.create(
  body: 'SessionStorage – это клиентское решение в HTML 5, которое позволяет:'
)
html_basic_test.questions.last.answers.create(
  body: 'Извлекать и использовать данные предыдущих сессий при условии того, что не
  были очищены cash и cookie'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: 'Создавать базу данных решений пользователей в памяти браузера'
)
html_basic_test.questions.last.answers.create(
  body: 'Извлекать и использовать данные только текущей сессии',
  correct: true
)
html_basic_test.questions.create(
  body: 'Что создастся при исполнении следующего кода:
<svg width="75" height="75">
<line x1="50" y1="0" x2="50" y2="100"
style="stroke:black" />
<line x1="0" y1="50" x2="100" y2="50"
style="stroke:black" />
</svg> ?'
)
html_basic_test.questions.last.answers.create(
  body: 'Знак «плюс»',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Знак «минус»'
)
html_basic_test.questions.last.answers.create(
  body: 'Знак «равно»'
)
html_basic_test.questions.create(
  body: 'Функция HTML 5 navigation.geolocation.getCurrentPosition() возвращает:'
)
html_basic_test.questions.last.answers.create(
  body: 'Встроенную в основной функционал сайта карту мира'
)
html_basic_test.questions.last.answers.create(
  body: 'Данные о местонахождении пользователя',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Данные о местонахождении сервера'
)
html_basic_test.questions.create(
  body: 'Заполните пропуски таким образом, чтобы получился валидный HTML документ.
  «First paragraph» - комментарий.
<___>
<body>
<! - - First paragraph ___>
<___> This is the first paragraph! </p>
<___>
</html>'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: 'html/; - - ?; p; /body'
)
html_basic_test.questions.last.answers.create(
  body: 'html v.5; - - !; /p; /body'
)
html_basic_test.questions.last.answers.create(
  body: 'html; - - !; p; /body',
  correct: true
)
html_basic_test.questions.create(
  body: 'HTML – это'
)
html_basic_test.questions.last.answers.create(
  body: 'Язык разметки',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Библиотека гипертекста'
)
html_basic_test.questions.last.answers.create(
  body: 'Скриптовый язык'
)
html_basic_test.questions.create(
  body: 'Обязательно ли использование тэгов <html> … </html>?'
)
html_basic_test.questions.last.answers.create(
  body: 'Да, без них браузер не распознает HTML-документ',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Да, если HTML-документ создается в блокноте или другом текстовом редакторе.
  В специальном компиляторе HTML эти тэги можно не использовать'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: 'Не обязательно'
)
html_basic_test.questions.create(
  body: 'Какой атрибут позволяет объединить ячейки таблицы по вертикали?'
)
html_basic_test.questions.last.answers.create(
  body: 'Union'
)
html_basic_test.questions.last.answers.create(
  body: 'Colspan'
)
html_basic_test.questions.last.answers.create(
  body: 'Rowspan',
  correct: true
)
html_basic_test.questions.create(
  body: 'Допустимое число заголовков первого уровня в HTML-документе составляет:'
)
html_basic_test.questions.last.answers.create(
  body: '1',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '3'
)
html_basic_test.questions.last.answers.create(
  body: '7'
)
html_basic_test.questions.create(
  body: 'Текст, выделенный курсивом, представлен в следующей записи:'
)
html_basic_test.questions.last.answers.create(
  body: '<del> курсив </del>'
)
html_basic_test.questions.last.answers.create(
  body: '<i> курсив </i>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<hr> курсив </hr>'
)
html_basic_test.questions.create(
  body: 'В HTML не существует … тэгов:'
)
html_basic_test.questions.last.answers.create(
  body: 'Одиночных'
)
html_basic_test.questions.last.answers.create(
  body: 'Парных'
)
html_basic_test.questions.last.answers.create(
  body: 'Тройных',
  correct: true
)
html_basic_test.questions.create(
  body: 'При создании сайтов используют кодировку:'
)
html_basic_test.questions.last.answers.create(
  body: 'UTF8',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'ASCII'
)
html_basic_test.questions.last.answers.create(
  body: 'UTF-32'
)
html_basic_test.questions.create(
  body: 'HTML-документ может иметь расширения:'
)
html_basic_test.questions.last.answers.create(
  body: '.html'
)
html_basic_test.questions.last.answers.create(
  body: '.html или .htm',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '.html или .txt'
)
html_basic_test.questions.create(
  body: 'Укажите устаревшие тэги для HTML 5:'
)
html_basic_test.questions.last.answers.create(
  body: '<applet>, <blink>, <u>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<ul>, <audio>, <pre>'
)
html_basic_test.questions.last.answers.create(
  body: '<code>, <s>, <embed>'
)
html_basic_test.questions.create(
  body: 'Тэг, подключающий к существующему HTML-документу скрипты, которые
  выполняются на клиентской стороне – это:'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: '<object>'
)
html_basic_test.questions.last.answers.create(
  body: '<script>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<client>'
)
html_basic_test.questions.create(
  body: 'Какой символ обозначает конец тэга?'
)
html_basic_test.questions.last.answers.create(
  body: '^'
)
html_basic_test.questions.last.answers.create(
  body: ';'
)
html_basic_test.questions.last.answers.create(
  body: '/',
  correct: true
)
html_basic_test.questions.create(
  body: 'Список, в котором элементы перечисления отмечаются буллетами, позволяет
  создать тэг:'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: '<ul>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<ol>'
)
html_basic_test.questions.last.answers.create(
  body: '<bl>'
)
html_basic_test.questions.create(
  body: 'Укажите корректную запись для создания чек-бокса:'
)
html_basic_test.questions.last.answers.create(
  body: '<input checkbox>'
)
html_basic_test.questions.last.answers.create(
  body: '<type input=”checkbox”>'
)
html_basic_test.questions.last.answers.create(
  body: '<input type=”checkbox”>',
  correct: true
)
html_basic_test.questions.create(
  body: 'Укажите корректную запись для создания выпадающего списка:'
)
html_basic_test.questions.last.answers.create(
  body: '<input type=”dropdown”>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<input dropdown list>'
)
html_basic_test.questions.last.answers.create(
  body: '<dropdown list>'
)
html_basic_test.questions.create(
  body: 'Какой атрибут HTML указывает альтернативный текст для изображения, если
  данное изображение не отобразится?'.gsub("\n ", '')
)
html_basic_test.questions.last.answers.create(
  body: 'imgalt'
)
html_basic_test.questions.last.answers.create(
  body: 'imgvar'
)
html_basic_test.questions.last.answers.create(
  body: 'alt',
  correct: true
)
html_basic_test.questions.create(
  body: 'Какой HTML-тэг используется для определения футера документа или раздела?'
)
html_basic_test.questions.last.answers.create(
  body: '<footer>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<bottom>'
)
html_basic_test.questions.last.answers.create(
  body: '<section>'
)
html_basic_test.questions.create(
  body: 'HTML-тэг, позволяющий воспроизводить аудиозаписи – это:'
)
html_basic_test.questions.last.answers.create(
  body: '<music>'
)
html_basic_test.questions.last.answers.create(
  body: '<audio>',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: '<sound>'
)
html_basic_test.questions.create(
  body: 'В HTML 5, onblur и onfocus – это:'
)
html_basic_test.questions.last.answers.create(
  body: 'Атрибуты событий',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Атрибуты стиля'
)
html_basic_test.questions.last.answers.create(
  body: 'Атрибуты подключения базы данных'
)
html_basic_test.questions.create(
  body: 'Графика, определенная SVG, отображается в формате:'
)
html_basic_test.questions.last.answers.create(
  body: 'CSS'
)
html_basic_test.questions.last.answers.create(
  body: 'JSOM'
)
html_basic_test.questions.last.answers.create(
  body: 'XML',
  correct: true
)
html_basic_test.questions.create(
  body: 'Что определяет тэг <aside>?'
)
html_basic_test.questions.last.answers.create(
  body: 'Дополнительное содержимое, т.е. то, что не включает основной документ',
  correct: true
)
html_basic_test.questions.last.answers.create(
  body: 'Ссылку на подключенный документ'
)
html_basic_test.questions.last.answers.create(
  body: 'Цветовое решение документа'
)

# Basic Ruby: questions/answers
ruby_basic_test = Test.find_by(title: 'Основы Ruby')
ruby_basic_test.questions.create(
  body: 'Где записана сокращенная форма кода ниже:
x = x / 3'
)
ruby_basic_test.questions.last.answers.create(
  body: 'x /= 3 ',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'Нет сокращенной формы'
)
ruby_basic_test.questions.last.answers.create(
  body: 'x = / 3'
)
ruby_basic_test.questions.create(
  body: 'Чем отличается puts от print:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Ничем, оба делают одно и тоже'
)
ruby_basic_test.questions.last.answers.create(
  body: 'print без пропуска строки, а puts с пропуском ',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'puts позволяет выводить переменные, а print только текст'
)
ruby_basic_test.questions.create(
  body: 'Какой метод позволяет перевести строку в нижний регистр:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'lowercase()'
)
ruby_basic_test.questions.last.answers.create(
  body: 'dcase()'
)
ruby_basic_test.questions.last.answers.create(
  body: 'downcase()',
  correct: true
)
ruby_basic_test.questions.create(
  body: 'Что выведет этот код:
some = 25
print(“Переменная: ” + some)'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Выведет: “Переменная: some”'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Выведет: “Переменная: 25”'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Будет выведена ошибка',
  correct: true
)
ruby_basic_test.questions.create(
  body: 'Где указана пустая переменная (без какого-либо значения):'
)
ruby_basic_test.questions.last.answers.create(
  body: 'some = 0'
)
ruby_basic_test.questions.last.answers.create(
  body: 'some = nil',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'some = “”'
)
ruby_basic_test.questions.create(
  body: 'В каком варианте вы получите число без пропуска строки от пользователя:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'num = gets'
)
ruby_basic_test.questions.last.answers.create(
  body: 'num = gets.chomp()'
)
ruby_basic_test.questions.last.answers.create(
  body: 'um = gets.chomp().to_i ',
  correct: true
)
ruby_basic_test.questions.create(
  body: 'Как называется самый популярный фреймворк Ruby для веба:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Ruby On Rails',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'Ruby Web'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Ruby Framework'
)
ruby_basic_test.questions.create(
  body: 'Что покажет этот код:
num = -6
num *= 2
num = num. abs()
res = Math. sqrt(num * 12)
print(“Результат: ” + res. round(). to_s)'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Выведет: Ошибку'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Выведет: “Результат: -12”'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Выведет: “Результат: 12”',
  correct: true
)
ruby_basic_test.questions.create(
  body: 'Сработает ли данный код:
print(“Введите имя: “)
name = gets
puts(“Имя: ” + name)'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Необходимо дописать gets.chomp()'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Код сработает в любом случае',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'Код сработает только если введут строку, а не число'
)
ruby_basic_test.questions.create(
  body: 'Динамический, рефлективный, интерпретируемый высокоуровневый язык
  программирования:'.gsub("\n ", '')
)
ruby_basic_test.questions.last.answers.create(
  body: 'Ruby',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'Dylan'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Scala'
)
ruby_basic_test.questions.create(
  body: 'Язык обладает независимой от операционной системы реализацией:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'одноточности'
)
ruby_basic_test.questions.last.answers.create(
  body: 'многопоточности',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'релевантности'
)
ruby_basic_test.questions.create(
  body: 'По особенностям синтаксиса он близок к языку:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Perl',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'Dylan'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Scala'
)
ruby_basic_test.questions.create(
  body: 'По объектно-ориентированному подходу близок к:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Smalltalk',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'Scala'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Dylan'
)
ruby_basic_test.questions.create(
  body: 'Некоторые черты языка взяты из:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Perl'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Scala'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Lisp',
  correct: true
)
ruby_basic_test.questions.create(
  body: 'Создатель Ruby:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Билл Гейтц'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Марк Цукербург'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Юкихиро Мацумото (Matz)',
  correct: true
)
ruby_basic_test.questions.create(
  body: 'В Японии Ruby стал популярным с момента появления первой общедоступной
  версии в:'.gsub("\n ", '')
)
ruby_basic_test.questions.last.answers.create(
  body: '2005 году'
)
ruby_basic_test.questions.last.answers.create(
  body: '1995 году ',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: '1999 году'
)
ruby_basic_test.questions.create(
  body: 'Ruby – полностью такой язык:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Специфический'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Объектно-ориентированный',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'Ориентировочно-последовательный'
)
ruby_basic_test.questions.create(
  body: 'Ruby использует вызов по соиспользованию (call-by-sharing), хотя в
  сообществе Ruby часто говорят, что он использует вызов по:'.gsub("\n ", '')
)
ruby_basic_test.questions.last.answers.create(
  body: 'Вычислению'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Памяти'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Ссылке',
  correct: true
)
ruby_basic_test.questions.create(
  body: 'Ruby не поддерживает множественное наследование, но вместо него есть мощный
  механизм:'.gsub("\n ", '')
)
ruby_basic_test.questions.last.answers.create(
  body: 'Фактов'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Примесей',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'Тем'
)
ruby_basic_test.questions.create(
  body: 'Ruby является таким языком:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'максипарадигменным'
)
ruby_basic_test.questions.last.answers.create(
  body: 'парадигменным'
)
ruby_basic_test.questions.last.answers.create(
  body: 'мультипарадигменным',
  correct: true
)
ruby_basic_test.questions.create(
  body: 'Ruby поддерживает такой стиль:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'динамический'
)
ruby_basic_test.questions.last.answers.create(
  body: 'процедурный',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'процессуальный'
)
ruby_basic_test.questions.create(
  body: 'Ruby позволяет обрабатывать исключения в стиле:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Java',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'Perl'
)
ruby_basic_test.questions.last.answers.create(
  body: 'Eiffel'
)
ruby_basic_test.questions.create(
  body: 'Ruby позволяет переопределять операторы, которые на самом деле являются:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'методами',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'способами'
)
ruby_basic_test.questions.last.answers.create(
  body: 'данными'
)
ruby_basic_test.questions.create(
  body: 'Ruby может динамически загружать расширения, если это позволяет:'
)
ruby_basic_test.questions.last.answers.create(
  body: 'память'
)
ruby_basic_test.questions.last.answers.create(
  body: 'операционная система',
  correct: true
)
ruby_basic_test.questions.last.answers.create(
  body: 'интернет'
)

# Basic Java: questions/answers
java_basic_test = Test.find_by(title: 'Основы Java')
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a + 2);
}'
)
java_basic_test.questions.last.answers.create(
  body: '52'
)
java_basic_test.questions.last.answers.create(
  body: '7',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '5+2'
)
java_basic_test.questions.last.answers.create(
  body: 'unhandled exception '
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a + "2");
}'
)
java_basic_test.questions.last.answers.create(
  body: '52',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '7'
)
java_basic_test.questions.last.answers.create(
  body: '5+2'
)
java_basic_test.questions.last.answers.create(
  body: 'unhandled exception '
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a / 2);
}'
)
java_basic_test.questions.last.answers.create(
  body: '2',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '1'
)
java_basic_test.questions.last.answers.create(
  body: '2.5'
)
java_basic_test.questions.last.answers.create(
  body: 'unhandled exception'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a / 2.0);
}'
)
java_basic_test.questions.last.answers.create(
  body: '2'
)
java_basic_test.questions.last.answers.create(
  body: '1'
)
java_basic_test.questions.last.answers.create(
  body: '2.5',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'unhandled exception'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a % 2);
}'
)
java_basic_test.questions.last.answers.create(
  body: '2'
)
java_basic_test.questions.last.answers.create(
  body: '1',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '2.5'
)
java_basic_test.questions.last.answers.create(
  body: 'unhandled exception'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
double a = 5;
System.out.println(a / 2);
}'
)
java_basic_test.questions.last.answers.create(
  body: '2'
)
java_basic_test.questions.last.answers.create(
  body: '1'
)
java_basic_test.questions.last.answers.create(
  body: '2.5',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'unhandled exception'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
double a = 5;
System.out.println((int) a / 2);
}'
)
java_basic_test.questions.last.answers.create(
  body: '2',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '1'
)
java_basic_test.questions.last.answers.create(
  body: '2.5'
)
java_basic_test.questions.last.answers.create(
  body: 'unhandled exception'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{11, 5, -4, 8, 4, 7};
for (int i = 0; i < array.length; i += 2) {
System.out.print(array[i]+" ");
}
}'
)
java_basic_test.questions.last.answers.create(
  body: '11 -4 4',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '0 2 4'
)
java_basic_test.questions.last.answers.create(
  body: 'ArrayIndexOutOfBoundsException'
)
java_basic_test.questions.last.answers.create(
  body: '11'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{11, 5, -4, 8, 4, 7};
for (int i = 0; i < array.length; i += 2) {
System.out.print(i+" ");
}
}'
)
java_basic_test.questions.last.answers.create(
  body: '11 -4 4'
)
java_basic_test.questions.last.answers.create(
  body: '0 2 4',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'ArrayIndexOutOfBoundsException'
)
java_basic_test.questions.last.answers.create(
  body: '11'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{11, 5, -4, 8, 4, 7};
for (int i = 0; i <= array.length; i += 2) {
System.out.print(array[i] + " ");
}
}'
)
java_basic_test.questions.last.answers.create(
  body: '11 -4 4'
)
java_basic_test.questions.last.answers.create(
  body: '0 2 4'
)
java_basic_test.questions.last.answers.create(
  body: 'ArrayIndexOutOfBoundsException',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '11'
)
java_basic_test.questions.create(
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
java_basic_test.questions.last.answers.create(
  body: 'выводит на консоль сумму цифр числа',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'выводит на консоль количество цифр числа'
)
java_basic_test.questions.last.answers.create(
  body: 'выводит на консоль сумму остатков от деления на 10 всех цифр числа'
)
java_basic_test.questions.last.answers.create(
  body: 'выводит на консоль число в обратном порядке'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int x = -2, y = 5, z;
z = x > y ? x : y;
System.out.println(z);
}'
)
java_basic_test.questions.last.answers.create(
  body: '-2'
)
java_basic_test.questions.last.answers.create(
  body: '5',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '3'
)
java_basic_test.questions.last.answers.create(
  body: '7'
)
java_basic_test.questions.create(
  body: 'Дан код:
public static void main(String[] args) {
int x = -2, y = 5, max;
// добавьте код
System.out.println(max);
}
Какой из предложенных ниже фрагментов кода выведет на консоль максимальное число?'
)
java_basic_test.questions.last.answers.create(
  body: 'max = x < y ? x : y;'
)
java_basic_test.questions.last.answers.create(
  body: 'max = x > y ? x : y;',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'if (x > y) max = x; else max = y;',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'if (x < y) max = x; else max = y;'
)
java_basic_test.questions.create(
  body: '--х;'
)
java_basic_test.questions.last.answers.create(
  body: 'постфиксный инкремент'
)
java_basic_test.questions.last.answers.create(
  body: 'префиксный инкремент'
)
java_basic_test.questions.last.answers.create(
  body: 'постфиксный декремент'
)
java_basic_test.questions.last.answers.create(
  body: 'префиксный декремент',
  correct: true
)
java_basic_test.questions.create(
  body: 'Что из нижеперечисленного является примитивным типом данных?'
)
java_basic_test.questions.last.answers.create(
  body: 'int[]'
)
java_basic_test.questions.last.answers.create(
  body: 'int',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'char',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'Boolean'
)
java_basic_test.questions.last.answers.create(
  body: 'Integer'
)
java_basic_test.questions.last.answers.create(
  body: 'String'
)
java_basic_test.questions.create(
  body: 'Как указать индекс последнего элемента массива?'
)
java_basic_test.questions.last.answers.create(
  body: 'array.length;'
)
java_basic_test.questions.last.answers.create(
  body: 'array.size;'
)
java_basic_test.questions.last.answers.create(
  body: 'array.length-1;',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'array.size-1;'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{15, 5, -8, -6, 0, 7};
System.out.println(array[array.length - 1]);
}'
)
java_basic_test.questions.last.answers.create(
  body: '0'
)
java_basic_test.questions.last.answers.create(
  body: '7',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '6'
)
java_basic_test.questions.last.answers.create(
  body: '5'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[3];
System.out.println(array[2]);
}'
)
java_basic_test.questions.last.answers.create(
  body: '0',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '1'
)
java_basic_test.questions.last.answers.create(
  body: '2'
)
java_basic_test.questions.last.answers.create(
  body: 'ArrayIndexOutOfBoundsException'
)
java_basic_test.questions.last.answers.create(
  body: 'null'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String[] array = new String[3];
System.out.println(array[2]);
}'
)
java_basic_test.questions.last.answers.create(
  body: '0'
)
java_basic_test.questions.last.answers.create(
  body: '1'
)
java_basic_test.questions.last.answers.create(
  body: '2'
)
java_basic_test.questions.last.answers.create(
  body: 'ArrayIndexOutOfBoundsException'
)
java_basic_test.questions.last.answers.create(
  body: 'null',
  correct: true
)
java_basic_test.questions.create(
  body: 'Выберите правильный вариант записи операции сравнения?'
)
java_basic_test.questions.last.answers.create(
  body: '0<=x;',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'x>=0;',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'x=>0;'
)
java_basic_test.questions.last.answers.create(
  body: '0=<x;'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String s = "Hello";
System.out.println(s + 5 + 4);
}'
)
java_basic_test.questions.last.answers.create(
  body: 'Hello54',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'Hello9'
)
java_basic_test.questions.last.answers.create(
  body: 'Hello 5 4'
)
java_basic_test.questions.last.answers.create(
  body: 'Hello 54'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String s = "Hello";
System.out.println(s + (5 + 4));
}'
)
java_basic_test.questions.last.answers.create(
  body: 'Hello54'
)
java_basic_test.questions.last.answers.create(
  body: 'Hello9',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'Hello 5 4'
)
java_basic_test.questions.last.answers.create(
  body: 'Hello 54'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
System.out.println(1.0 / 0);
}'
)
java_basic_test.questions.last.answers.create(
  body: 'Infinity',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'NAN'
)
java_basic_test.questions.last.answers.create(
  body: 'ArithmeticException: / by zero'
)
java_basic_test.questions.last.answers.create(
  body: 'не позволит запустить код на выполнение'
)
java_basic_test.questions.create(
  body: 'Какой модификатор доступа необходимо использовать, чтобы переменная была
  видна только в текущем классе?'.gsub("\n ", '')
)
java_basic_test.questions.last.answers.create(
  body: 'public'
)
java_basic_test.questions.last.answers.create(
  body: 'private',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'protected'
)
java_basic_test.questions.last.answers.create(
  body: 'default (package visible) '
)
java_basic_test.questions.create(
  body: 'Какой модификатор доступа необходимо использовать, чтобы переменная была
  видна везде?'.gsub("\n ", '')
)
java_basic_test.questions.last.answers.create(
  body: 'public',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'private'
)
java_basic_test.questions.last.answers.create(
  body: 'protected'
)
java_basic_test.questions.last.answers.create(
  body: 'default (package visible) '
)
java_basic_test.questions.create(
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
java_basic_test.questions.last.answers.create(
  body: 'while ((z >= 0) && (z <= 15))',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'while ((z >= 0) & (z <= 15))'
)
java_basic_test.questions.last.answers.create(
  body: 'while ((z >= 0) || (z <= 15))'
)
java_basic_test.questions.last.answers.create(
  body: 'while ((z >= 0) != (z <= 15))'
)
java_basic_test.questions.last.answers.create(
  body: 'while ((z >= 0) == (z <= 15))'
)
java_basic_test.questions.last.answers.create(
  body: 'while ((z >= 0) == (z <= 15))'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int x = 125_121_148;
System.out.println(++x);
}'
)
java_basic_test.questions.last.answers.create(
  body: 'ошибка на этапе компиляции'
)
java_basic_test.questions.last.answers.create(
  body: 'ошибка во время выполнения'
)
java_basic_test.questions.last.answers.create(
  body: '125121149',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '125121148'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String test = "Hello";
String test2 = "Hello";
System.out.println(test==test2);
}'
)
java_basic_test.questions.last.answers.create(
  body: 'true',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'false'
)
java_basic_test.questions.last.answers.create(
  body: 'Hello'
)
java_basic_test.questions.last.answers.create(
  body: 'null'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String test = new String("Hello");
String test2 = new String("Hello");
System.out.println(test==test2);
}'
)
java_basic_test.questions.last.answers.create(
  body: 'true'
)
java_basic_test.questions.last.answers.create(
  body: 'false',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'Hello'
)
java_basic_test.questions.last.answers.create(
  body: 'null'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного фрагмента кода?
for(;;) {
}'
)
java_basic_test.questions.last.answers.create(
  body: 'бесконечный цикл',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'ошибка на этапе компиляции'
)
java_basic_test.questions.last.answers.create(
  body: 'ошибка на этапе выполнения'
)
java_basic_test.questions.last.answers.create(
  body: 'этот код никогда не выполнится'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int sum = 0;
for (int i = 1; i <= 3; sum += i++) ;
System.out.println(sum);
}'
)
java_basic_test.questions.last.answers.create(
  body: '6',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '3'
)
java_basic_test.questions.last.answers.create(
  body: 'compile error'
)
java_basic_test.questions.last.answers.create(
  body: '5'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
byte x = 127;
x += 2;
System.out.println(x);
}'
)
java_basic_test.questions.last.answers.create(
  body: '-127',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '129'
)
java_basic_test.questions.last.answers.create(
  body: 'runtime error'
)
java_basic_test.questions.last.answers.create(
  body: 'compile error'
)
java_basic_test.questions.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
byte x = -128;
x -= 2;
System.out.println(x);
}'
)
java_basic_test.questions.last.answers.create(
  body: '126',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: '-130'
)
java_basic_test.questions.last.answers.create(
  body: '2'
)
java_basic_test.questions.last.answers.create(
  body: 'compile error'
)
java_basic_test.questions.create(
  body: 'Какие из следующих объявлений переменных верны?'
)
java_basic_test.questions.last.answers.create(
  body: 'int 1x;'
)
java_basic_test.questions.last.answers.create(
  body: 'double t; int x;'
)
java_basic_test.questions.last.answers.create(
  body: 'int f,f;'
)
java_basic_test.questions.last.answers.create(
  body: 'int x,X; double a; a1;'
)
java_basic_test.questions.last.answers.create(
  body: 'String book1; book2;'
)
java_basic_test.questions.last.answers.create(
  body: 'char symbol1,symbol2,symbol_3;',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'int x,a,b; double y,z,x;'
)
java_basic_test.questions.last.answers.create(
  body: 'int x; double X;',
  correct: true
)
java_basic_test.questions.create(
  body: 'Выберите вариант объявления массива в стиле Java:'
)
java_basic_test.questions.last.answers.create(
  body: 'String [] birthdays = new String[10];',
  correct: true
)
java_basic_test.questions.last.answers.create(
  body: 'String birthdays [] = new String[10];'
)
java_basic_test.questions.last.answers.create(
  body: 'String birthdays [] = String[10];'
)
java_basic_test.questions.last.answers.create(
  body: 'String birthdays = String[];'
)

# Basic Java Script: questions/answers
java_script_basic_test = Test.find_by(title: 'Основы JavaScript')
java_script_basic_test.questions.create(
  body: 'Какую функцию нужно использовать, чтобы пользователь мог ввести свой текст
  (ответ) в окошке?'.gsub("\n ", '')
)
java_script_basic_test.questions.last.answers.create(
  body: 'print'
)
java_script_basic_test.questions.last.answers.create(
  body: 'prompt',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'confirm'
)
java_script_basic_test.questions.last.answers.create(
  body: 'setTimeout'
)
java_script_basic_test.questions.create(
  body: 'Какую функцию нужно использовать, чтобы вывести на экран текст в окошке?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'setInterval'
)
java_script_basic_test.questions.last.answers.create(
  body: 'history'
)
java_script_basic_test.questions.last.answers.create(
  body: 'alert',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'open'
)
java_script_basic_test.questions.create(
  body: 'Что в строке ниже?
var a;'
)
java_script_basic_test.questions.last.answers.create(
  body: 'функция'
)
java_script_basic_test.questions.last.answers.create(
  body: 'переменная',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'команда'
)
java_script_basic_test.questions.last.answers.create(
  body: 'оператор'
)
java_script_basic_test.questions.create(
  body: 'В какой строке ошибка?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'var a;'
)
java_script_basic_test.questions.last.answers.create(
  body: 'var a = 3;'
)
java_script_basic_test.questions.last.answers.create(
  body: 'var = 3;',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'a = 3;'
)
java_script_basic_test.questions.create(
  body: 'Для чего нужна строка?
var username = prompt("Ваше имя");'
)
java_script_basic_test.questions.last.answers.create(
  body: 'Создать переменную и записать в неё имя, которое вводит пользователь',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'Вывести имя пользователя на экран'
)
java_script_basic_test.questions.last.answers.create(
  body: 'Создать пустую переменную'
)
java_script_basic_test.questions.last.answers.create(
  body: 'Спросить у пользователя его имя'
)
java_script_basic_test.questions.create(
  body: 'С помощью какого оператора можно найти остаток от деления?'
)
java_script_basic_test.questions.last.answers.create(
  body: '**'
)
java_script_basic_test.questions.last.answers.create(
  body: '%',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: '--'
)
java_script_basic_test.questions.last.answers.create(
  body: '?'
)
java_script_basic_test.questions.create(
  body: 'Какой оператор прибавляет к числу единицу?'
)
java_script_basic_test.questions.last.answers.create(
  body: '--'
)
java_script_basic_test.questions.last.answers.create(
  body: '++',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: '&&'
)
java_script_basic_test.questions.last.answers.create(
  body: '||'
)
java_script_basic_test.questions.create(
  body: 'Как преобразовать введённую строку в число?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'var a = Number(prompt("Введите число"))',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'var a = (Number)(prompt("Введите число"))'
)
java_script_basic_test.questions.last.answers.create(
  body: 'var a = (Number)prompt("Введите число")'
)
java_script_basic_test.questions.last.answers.create(
  body: 'var a = prompt("Введите число")'
)
java_script_basic_test.questions.create(
  body: 'Какой оператор определит, равны ли две переменные?'
)
java_script_basic_test.questions.last.answers.create(
  body: '<'
)
java_script_basic_test.questions.last.answers.create(
  body: '>'
)
java_script_basic_test.questions.last.answers.create(
  body: '='
)
java_script_basic_test.questions.last.answers.create(
  body: '<='
)
java_script_basic_test.questions.last.answers.create(
  body: '>='
)
java_script_basic_test.questions.last.answers.create(
  body: '==',
  correct: true
)
java_script_basic_test.questions.create(
  body: 'Какой оператор поможет определить, что две переменные НЕ равны друг другу?'
)
java_script_basic_test.questions.last.answers.create(
  body: '<'
)
java_script_basic_test.questions.last.answers.create(
  body: '>'
)
java_script_basic_test.questions.last.answers.create(
  body: '!=',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: '<='
)
java_script_basic_test.questions.last.answers.create(
  body: '>='
)
java_script_basic_test.questions.last.answers.create(
  body: '=='
)
java_script_basic_test.questions.create(
  body: 'С какого слова начинается условие?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'else'
)
java_script_basic_test.questions.last.answers.create(
  body: 'loop'
)
java_script_basic_test.questions.last.answers.create(
  body: 'if',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'then'
)
java_script_basic_test.questions.last.answers.create(
  body: 'begin'
)
java_script_basic_test.questions.last.answers.create(
  body: 'function'
)
java_script_basic_test.questions.last.answers.create(
  body: 'for'
)
java_script_basic_test.questions.create(
  body: 'Пользователь вводит два числа, нужно определить какое из них больше. В каком
  варианте задача решена верно?'.gsub("\n ", '')
)
java_script_basic_test.questions.last.answers.create(
  body: 'var a = Number(prompt("Число 1: "));
var b= Number(prompt("Число 2: "));
if (a>b)
alert ("Наибольшее: "+a);
else alert ("Наибольшее: "+b);',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'var a = prompt("Число 1: ");
var b= prompt("Число 2: ");
if (a>b)
alert ("Наибольшее: "+a);
else alert ("Наибольшее: "+b);'
)
java_script_basic_test.questions.last.answers.create(
  body: 'Number(prompt("Число 1: "));
Number(prompt("Число 2: "));
if (a>b)
alert ("Наибольшее: "+a);
else alert ("Наибольшее: "+b);'
)
java_script_basic_test.questions.last.answers.create(
  body: 'var a = Number(prompt("Число 1: "));
var b= Number(prompt("Число 2: "));
if (a>b)
alert ("Наибольшее: "+a);'
)
java_script_basic_test.questions.create(
  body: 'В каких вариантах при создании условия допущена ошибка?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'if (a > b)
alert(“Наибольшее ” + a);'
)
java_script_basic_test.questions.last.answers.create(
  body: 'if (a < b)
alert(“Наименьшее ” + a);
else alert(“Наименьшее ” + b);'
)
java_script_basic_test.questions.last.answers.create(
  body: 'if (a==b)
{
alert(“Числа равны”);
с = a + b;
}'
)
java_script_basic_test.questions.last.answers.create(
  body: '(a > b)
alert(“Наибольшее ” + a);',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'if a > b
alert(“Наибольшее ” + a);',
  correct: true
)
java_script_basic_test.questions.create(
  body: 'С какого слова начинается цикл?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'else'
)
java_script_basic_test.questions.last.answers.create(
  body: 'loop'
)
java_script_basic_test.questions.last.answers.create(
  body: 'if'
)
java_script_basic_test.questions.last.answers.create(
  body: 'then'
)
java_script_basic_test.questions.last.answers.create(
  body: 'begin'
)
java_script_basic_test.questions.last.answers.create(
  body: 'function'
)
java_script_basic_test.questions.last.answers.create(
  body: 'for',
  correct: true
)
java_script_basic_test.questions.create(
  body: 'В каком варианте цикл создан верно?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'for (var i = 0; i < 10; i++) {
alert(“Цифра ” + i);
}',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'for (i = 0; i < 10; i++) {
alert(“Цифра ” + i);
}'
)
java_script_basic_test.questions.last.answers.create(
  body: 'for (var i == 0; i < 10; i++) {
alert(“Цифра ” + i);
}'
)
java_script_basic_test.questions.last.answers.create(
  body: 'for var i = 0; i < 10; i++ {
alert(“Цифра ” + i);
}'
)
java_script_basic_test.questions.create(
  body: 'Какие бывают циклы в JavaScript? Отметьте все правильные варианты.'
)
java_script_basic_test.questions.last.answers.create(
  body: 'for',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'while',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'do...while',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'let'
)
java_script_basic_test.questions.last.answers.create(
  body: 'if'
)
java_script_basic_test.questions.last.answers.create(
  body: 'var'
)
java_script_basic_test.questions.create(
  body: 'Что такое массив?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'спископодобный элемент',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'переменная'
)
java_script_basic_test.questions.last.answers.create(
  body: 'свойство'
)
java_script_basic_test.questions.create(
  body: 'Что выполняется во второй строке кода?
var animals = [‘кошка’, ’собака’, ‘хомяк’];
animals.push(‘попугай’);'
)
java_script_basic_test.questions.last.answers.create(
  body: 'удаление элемента в конце массива'
)
java_script_basic_test.questions.last.answers.create(
  body: 'добавление элемента в конец массива',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'добавление элемента в начало массива'
)
java_script_basic_test.questions.create(
  body: 'Что выполняется во второй строке кода?
var animals = [‘кошка’, ’собака’, ‘хомяк’];
animals.pop();'
)
java_script_basic_test.questions.last.answers.create(
  body: 'удаление элемента в конце массива',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'добавление элемента в конец массива'
)
java_script_basic_test.questions.last.answers.create(
  body: 'удаление элемента в начале массива'
)
java_script_basic_test.questions.create(
  body: 'С какого слова начинается функция?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'else'
)
java_script_basic_test.questions.last.answers.create(
  body: 'loop'
)
java_script_basic_test.questions.last.answers.create(
  body: 'if'
)
java_script_basic_test.questions.last.answers.create(
  body: 'then'
)
java_script_basic_test.questions.last.answers.create(
  body: 'begin'
)
java_script_basic_test.questions.last.answers.create(
  body: 'function',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'for'
)
java_script_basic_test.questions.create(
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
java_script_basic_test.questions.last.answers.create(
  body: '2'
)
java_script_basic_test.questions.last.answers.create(
  body: '3'
)
java_script_basic_test.questions.last.answers.create(
  body: '6',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: '9'
)
java_script_basic_test.questions.create(
  body: 'В каком варианте функция создана без ошибок?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'function square (side) {
x = side * side;
return x;
}',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'function (side) {
x = side * side;
return x;
}'
)
java_script_basic_test.questions.last.answers.create(
  body: 'function square (side)
x = side * side;
return x;'
)
java_script_basic_test.questions.last.answers.create(
  body: 'function square {
x = side * side;
return x;
}'
)
java_script_basic_test.questions.create(
  body: 'Для чего нужна функция getElementById()?'
)
java_script_basic_test.questions.last.answers.create(
  body: 'ввод текста'
)
java_script_basic_test.questions.last.answers.create(
  body: 'поиск элемента в HTML по его ID',
  correct: true
)
java_script_basic_test.questions.last.answers.create(
  body: 'добавление элемента в массив'
)
java_script_basic_test.questions.last.answers.create(
  body: 'поиск текста'
)
java_script_basic_test.questions.create(
  body: 'Что делает строка ниже?
document.getElementById(“p1”).innerHTML = “Привет!”;'
)
java_script_basic_test.questions.last.answers.create(
  body: 'ищет элемент в HTML'
)
java_script_basic_test.questions.last.answers.create(
  body: 'ищет элемент в HTML и удаляет в нём текст'
)
java_script_basic_test.questions.last.answers.create(
  body: 'удаляет элемент в HTML'
)
java_script_basic_test.questions.last.answers.create(
  body: 'ищет элемент в HTML и меняет в нём текст',
  correct: true
)

# Quiz: Planets: questions/answers
quiz_planets_test = Test.find_by(title: 'Викторина: Планеты солнечной системы')
quiz_planets_test.questions.create(
  body: 'Сколько спутников у Марса?',
  answer_explanation: 'У Марса два спутника: Фобос и Деймос.'
)
quiz_planets_test.questions.last.answers.create(
  body: '13'
)
quiz_planets_test.questions.last.answers.create(
  body: '2',
  correct: true
)
quiz_planets_test.questions.last.answers.create(
  body: '50'
)
quiz_planets_test.questions.last.answers.create(
  body: '1'
)
quiz_planets_test.questions.create(
  body: 'Самый большой вулкан Солнечной системы называется «Гора Олимп». Где он
  находится?'.gsub("\n ", ''),
  answer_explanation: 'Гора Олимп, крупнейший вулкан Солнечной системы находится на
  Марсе. Высота вулкана — 26 км от основания, диаметр — около 540 км.'.gsub("\n ", '')
)
quiz_planets_test.questions.last.answers.create(
  body: 'Юпитер'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Земля'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Венера'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Марс',
  correct: true
)
quiz_planets_test.questions.create(
  body: 'Какая планета ближе всех расположена к Солнцу?',
  answer_explanation: 'Меркурий — ближайшая к Солнцу планета.'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Земля'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Венера'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Меркурий',
  correct: true
)
quiz_planets_test.questions.last.answers.create(
  body: 'Нептун'
)
quiz_planets_test.questions.create(
  body: 'Большое красное пятно на Юпитере, что это?',
  answer_explanation: 'Большое красное пятно — это сильная буря в атмосфере Юпитера.'
)
quiz_planets_test.questions.last.answers.create(
  body: 'вулкан'
)
quiz_planets_test.questions.last.answers.create(
  body: 'озеро'
)
quiz_planets_test.questions.last.answers.create(
  body: 'буря',
  correct: true
)
quiz_planets_test.questions.last.answers.create(
  body: 'кратер'
)
quiz_planets_test.questions.create(
  body: 'Из чего в основном состоит Солнце?',
  answer_explanation: 'Солнце в основном состоит из двух газов: водорода и гелия.'
)
quiz_planets_test.questions.last.answers.create(
  body: 'жидкая лава'
)
quiz_planets_test.questions.last.answers.create(
  body: 'расплавленный метал'
)
quiz_planets_test.questions.last.answers.create(
  body: 'газ',
  correct: true
)
quiz_planets_test.questions.last.answers.create(
  body: 'камень'
)
quiz_planets_test.questions.create(
  body: 'Из чего в основном состоят кометы?',
  answer_explanation: 'Кометы в основном состоят из льда и пыли.'
)
quiz_planets_test.questions.last.answers.create(
  body: 'ядовитая жидкость'
)
quiz_planets_test.questions.last.answers.create(
  body: 'лед и пыль',
  correct: true
)
quiz_planets_test.questions.last.answers.create(
  body: 'ржавый металл'
)
quiz_planets_test.questions.last.answers.create(
  body: 'расплавленный камень'
)
quiz_planets_test.questions.create(
  body: 'К какой планете принадлежат спутники Оберон и Титания?',
  answer_explanation: 'Оберон и Титания — два из 27 спутников Урана.'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Юпитер'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Уран',
  correct: true
)
quiz_planets_test.questions.last.answers.create(
  body: 'Венера'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Земля'
)
quiz_planets_test.questions.create(
  body: 'Какой из вариантов лучше всего описывает атмосферу, окружающую Венеру?',
  answer_explanation: 'Венера окружена кислотными облаками, а ее средняя температура
  на поверхности может достигать 735 К (462 °C). Поэтому самое подходящее описание
  атмосферы Венеры — горячая и ядовитая.'.gsub("\n ", '')
)
quiz_planets_test.questions.last.answers.create(
  body: 'яркая и солнечная'
)
quiz_planets_test.questions.last.answers.create(
  body: 'холодная и снежная'
)
quiz_planets_test.questions.last.answers.create(
  body: 'холодная и влажная'
)
quiz_planets_test.questions.last.answers.create(
  body: 'горячая и ядовитая',
  correct: true
)
quiz_planets_test.questions.create(
  body: 'Где находится пояс астероидов?',
  answer_explanation: 'Пояс астероидов находится в области между планетами Марс и
  Юпитер.'.gsub("\n ", '')
)
quiz_planets_test.questions.last.answers.create(
  body: 'между Юпитером и Сатурном'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Землей и Венерой'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Марсом и Юпитером',
  correct: true
)
quiz_planets_test.questions.last.answers.create(
  body: 'Землей и Марсом'
)
quiz_planets_test.questions.create(
  body: 'Какая из этих планет самая маленькая?',
  answer_explanation: 'Меркурий, его ширина составляет 4879 км.'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Юпитер'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Уран'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Земля'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Меркурий',
  correct: true
)
quiz_planets_test.questions.create(
  body: 'Какие две планеты вращаются в обратном направлении от остальных?',
  answer_explanation: 'Уран и Венера'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Уран и Венера',
  correct: true
)
quiz_planets_test.questions.last.answers.create(
  body: 'Венера и Плутон'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Меркурий и Юпитер'
)
quiz_planets_test.questions.last.answers.create(
  body: 'Земля и Нептун'
)

# Quiz: Yes/No: questions/answers
quiz_yes_no_test = Test.find_by(title: 'Викторина: Да/нет')
quiz_yes_no_test.questions.create(
  body: 'Быки реагируют на красный цвет?',
  answer_explanation: 'Быки практически не различают цветов. В корриде они реагируют
  не на красный, а на раздражающее размахивание плащом.'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)
quiz_yes_no_test.questions.create(
  body: 'Страусы от опасности прячут голову в песок?',
  answer_explanation: 'Страусы, когда чувствуют опасность, убегают. Миф о том, что
  они закапываются, возник, возможно, из-за того, что, обессилев от долгой погони,
  они просто роняют голову со своей длинной шеей.'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)
quiz_yes_no_test.questions.create(
  body: 'Бананы растут на пальмах?',
  answer_explanation: 'Банановое растение — это гигантская трава. А сами бананы —
  ягоды.'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)
quiz_yes_no_test.questions.create(
  body: 'Эйнштейн был двоечником?',
  answer_explanation: 'Эйнштейн учился не отлично, но хорошо. Единственная низкая
  оценка в его аттестате — тройка по французскому.'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)
quiz_yes_no_test.questions.create(
  body: 'Летучие мыши слепые?',
  answer_explanation: 'У летучих мышей вполне нормальное зрение. Они совмещают его
  возможности с эхолокацией.'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)
quiz_yes_no_test.questions.create(
  body: 'Молния не может ударить дважды в одно и то же место?',
  answer_explanation: 'Молния способна ударить в одно место не два и даже не три раза.
  В некоторые здания она бьет до ста раз в год.'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)
quiz_yes_no_test.questions.create(
  body: 'Площадь суши России больше, чем у Плутона?',
  answer_explanation: 'Площадь суши России — 17 млн км2. Это больше, чем у Плутона
  (16,6 млн  км2).'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да',
  correct: true
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет'
)
quiz_yes_no_test.questions.create(
  body: 'Верблюды накапливают в горбах воду?',
  answer_explanation: 'Верблюды накапливают в горбах не воду, а жир.'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)
quiz_yes_no_test.questions.create(
  body: 'Если взять в руку лягушку — появится бородавка?',
  answer_explanation: 'Бородавки могут появиться на руках от вируса папилломы человека.
  Но не лягушки.'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)
quiz_yes_no_test.questions.create(
  body: 'Нервные клетки не восстанавливаются?',
  answer_explanation: 'В мозге постоянно происходит процесс нейрогенеза — образования
  новых нервных клеток из клеток-предшественниц. С возрастом процесс замедляется.
  Но все же идет!'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)
quiz_yes_no_test.questions.create(
  body: 'Великая Китайская стена — единственный рукотворный объект на Земле, видимый
  из космоса?'.gsub("\n ", ''),
  answer_explanation: 'С низкой орбиты можно увидеть отнюдь не только Великую
  Китайскую стену. Египетские пирамиды, например, видно ничуть не хуже.'.gsub("\n ", '')
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Да'
)
quiz_yes_no_test.questions.last.answers.create(
  body: 'Нет',
  correct: true
)

# Quiz: Animals: questions/answers
quiz_animals_test = Test.find_by(title: 'Викторина: Животные')
quiz_animals_test.questions.create(
  body: 'Какая кошка самая большая на планете?',
  answer_explanation: 'Крупнейший подвид животного обитает в Сибири и достигает веса
  свыше 300 кг. При этом другие кошки тоже заслуживают особого внимания: рычание
  льва заставляет содрогаться всю саванну в окрестностях 5 километров, а гепард
  находится в Книге рекордов Гиннесса как самое быстрое млекопитающее.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'Лев'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Тигр',
  correct: true
)
quiz_animals_test.questions.last.answers.create(
  body: 'Гепард'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Барс'
)
quiz_animals_test.questions.create(
  body: 'Какое сухопутное животное может открыть рот максимально широко?',
  answer_explanation: 'У бегемота огромный рот, который открывается на 150 градусов
  и 1 м в высоту. Внутри челюстей расположены массивные зубы длиной около 45 см.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'Аллигатор'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Крокодил'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Бабуин'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Бегемот',
  correct: true
)
quiz_animals_test.questions.create(
  body: 'Какое животное самое крупное на Земле?',
  answer_explanation: 'Африканский слон относится к крупнейшим наземным обитателям,
  но самым крупным животным на планете считается синий кит. Его вес может достигать
  200 тонн, что сопоставимо с массой 33 слонов.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'Африканский слон'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Синий кит',
  correct: true
)
quiz_animals_test.questions.last.answers.create(
  body: 'Кашалот'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Гигантский кальмар'
)
quiz_animals_test.questions.create(
  body: 'Какое млекопитающее умеет летать?',
  answer_explanation: 'Белка-летяга и колуго (еще его называют «летающим лемуром»)
  только прыгают с одного дерева на другое, а белоголовый орлан относится к птицам,
  а не к млекопитающим. Поэтому единственный правильный ответ – летучая мышь.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'Летучая мышь',
  correct: true
)
quiz_animals_test.questions.last.answers.create(
  body: 'Белка-летяга'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Белоголовый орлан'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Колуго'
)
quiz_animals_test.questions.create(
  body: 'Как называется животное, которое употребляет в пищу растения и мясо?',
  answer_explanation: 'Плотоядные особи употребляют мясо, травоядные – только
  растительную пищу, а всеядные – и те, и другие продукты. Под пескатарианством
  подразумевается поедание овощей и рыбы.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'Плотоядное животное'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Травоядное животное'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Всеядное животное',
  correct: true
)
quiz_animals_test.questions.last.answers.create(
  body: 'Пескатариан'
)
quiz_animals_test.questions.create(
  body: 'Почему каланы («морские выдры») держатся за руки?',
  answer_explanation: 'Подобное явление относится к самым зрелищным и очаровательным
  в мире природы – животные держатся вместе в плавучих группах, которые называются
  «плотами», и часто связывают лапы, словно держатся за руки. Такой подход позволяет
  им поддерживать тесный телесный контакт и не уплывать далеко от семьи.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'Потому что они любят друг друга'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Чтобы показать, что они в одной семье'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Чтобы они не уплывали, когда спят',
  correct: true
)
quiz_animals_test.questions.last.answers.create(
  body: 'Потому что они играют'
)
quiz_animals_test.questions.create(
  body: 'Как отличить насекомое от паука?',
  answer_explanation: 'Несмотря на массу сходств с другими ползучими насекомыми,
  пауки не являются насекомыми. Они принадлежат к классу паукообразных, которые
  сами употребляют в пищу насекомых.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'У насекомых три части тела, у пауков – две'
)
quiz_animals_test.questions.last.answers.create(
  body: 'У насекомых шесть ног, у пауков – восемь'
)
quiz_animals_test.questions.last.answers.create(
  body: 'У насекомых могут быть крылья, у пауков они отсутствуют'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Все вышеперечисленные факты',
  correct: true
)
quiz_animals_test.questions.create(
  body: 'Чем утконос отличается от других млекопитающих?',
  answer_explanation: 'Утконос является одним из двух млекопитающих, которые
  откладывают яйца. Еще один вид – ехидна, или колючий муравьед, напоминающий
  дикобраза. Животные обитают в Австралии и практически не эволюционируют с
  доисторических времен. Утконос проводит яйцекладку в своей норе, а у ехидны
  для яиц есть сумка.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'Крякает, как утка'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Откладывает яйца ',
  correct: true
)
quiz_animals_test.questions.last.answers.create(
  body: 'Строит гнезда'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Ковыляет'
)
quiz_animals_test.questions.create(
  body: 'Почему змеи высовывают язык?',
  answer_explanation: 'Змеи высовывают язык, чтобы получить химические данные из
  окружающей среды и передать их обратно к двум рецепторам на нёбе. Это объясняет,
  почему у змей раздвоенный язык.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'Чтобы напугать хищников'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Чтобы облизать добычу'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Чтобы издать шипящий звук'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Чтобы «понюхать» воздух',
  correct: true
)
quiz_animals_test.questions.create(
  body: 'Как называется явление, обозначающее, что на Земле не осталось ни одного
  животного конкретного вида?'.gsub("\n ", ''),
  answer_explanation: 'Самыми яркими представителями группы вымерших животных
  являются динозавры.'.gsub("\n ", '')
)
quiz_animals_test.questions.last.answers.create(
  body: 'Эволюция'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Сохранение'
)
quiz_animals_test.questions.last.answers.create(
  body: 'Вымирание',
  correct: true
)
quiz_animals_test.questions.last.answers.create(
  body: 'Находящиеся под угрозой исчезновения'
)

# Gererate randomized additional initial data
Category.all.count.times do |db_category_id|
  3.times do |i|
    rand(1..3).times do |j|
      test_level = i + 1
      Test.create(
        title: "Болванка [#{Category.find(db_category_id + 1).title}] уровень #{i + 1} номер #{j + 1}",
        category: Category.find_by(id: db_category_id + 1),
        author: User.find_by(id: rand(1..User.count)),
        level: test_level
      )
    end
  end
end

Test.where("title LIKE 'Болванка%'").each do |db_test|
  rand(5..15).times do
    db_test.questions.create(
      body: Faker::Markdown.emphasis
    )
    question_answer_count = rand(3..5)
    correct_answer = rand(1..question_answer_count)
    question_answer_count.times do |i|
      db_test.questions.last.answers.create(
        body: "#{'(true)' if i + 1 == correct_answer} #{Faker::Book.title}",
        correct: i + 1 == correct_answer
      )
    end
  end
end

# def calculate_interrupt_question_id(db_questions, user_test_interrupt_chance)
#   case rand(0..99) < user_test_interrupt_chance
#   when true
#     db_questions[rand(0..db_questions.length - 1)].id
#   when false
#     -1
#   end
# end

# def add_test_ids_to_user_tests(db_user_tests, test_id)
#   db_user_tests << '/' unless db_user_tests.empty?
#   db_user_tests << "#{test_id}="
# end

# def add_answer_ids_to_user_tests(db_question, db_user_tests, user_question_success_chance)
#   db_correct_answers = Answer.where(question_id: db_question.id).where(correct: true)
#   db_wrong_answers = Answer.where(question_id: db_question.id).where(correct: false)
#   case rand(0..99) < user_question_success_chance
#   when true
#     add_answers_to_to_user_tests(db_user_tests, db_correct_answers, 'correct')
#   when false
#     add_answers_to_to_user_tests(db_user_tests, db_wrong_answers, 'wrong')
#   end
# end

# def add_question_ids_to_to_user_tests(db_question, db_user_tests)
#   db_user_tests << '+' unless db_user_tests.end_with?('=')
#   db_user_tests << "#{db_question.id}:"
# end

# def add_answers_to_to_user_tests(db_user_tests, db_answers, answers_type)
#   case answers_type == 'correct'
#   when true
#     db_answers.each do |answer|
#       db_user_tests << ',' unless db_user_tests.end_with?('+', '=', ':')
#       db_user_tests << answer.id.to_s
#     end
#   when false
#     db_user_tests << db_answers[rand(0..db_answers.length - 1)].id.to_s
#   end
# end

zero_activity_user_chance = rand(20..50)
User.all.each do |user|
  next if rand(0..99) < zero_activity_user_chance

  user_test_start_chance = rand(30..70)
  # user_test_interrupt_chance = rand(3..10)
  # user_question_success_chance = rand(30..100)
  # db_user_tests = ''
  Test.count.times do |i|
    next unless rand(0..99) < user_test_start_chance

    UsersTest.create(user: user, test: Test.find_by(id: i + 1))
    # user.tests.find_by(id: i + 1)
    # add_test_ids_to_user_tests(db_user_tests, i + 1)
    # db_questions = Question.where(test_id: i + 1)
    # interrupt_question_id = calculate_interrupt_question_id(db_questions, user_test_interrupt_chance)
    # db_questions.each do |db_question|
    #   add_question_ids_to_to_user_tests(db_question, db_user_tests)
    #   add_answer_ids_to_user_tests(db_question, db_user_tests, user_question_success_chance)
    #   break if db_question.id == interrupt_question_id
    # end
  end
  # user.update(tests: db_user_tests)
end

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
