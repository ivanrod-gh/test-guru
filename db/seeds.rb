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
quiz_id = Category.create(title: 'Викторины').id

html_basic_id = Test.create(
  title: 'Основы HTML',
  category_id: Category.find_by(title: 'HTML').id
).id
ruby_basic_id = Test.create(
  title: 'Основы Ruby',
  category_id: Category.find_by(title: 'Ruby').id
).id
java_basic_id = Test.create(
  title: 'Основы Java',
  category_id: Category.find_by(title: 'Java').id
).id
java_script_basic_id = Test.create(
  title: 'Основы JavaScript',
  category_id: Category.find_by(title: 'JavaScript').id
).id
quiz_planets_id = Test.create(
  title: 'Викторина: Планеты солнечной системы',
  category_id: quiz_id
).id
quiz_yes_no_id = Test.create(
  title: 'Викторина: Да/нет',
  category_id: quiz_id
).id
quiz_animals_id = Test.create(
  title: 'Викторина: Животные',
  category_id: quiz_id
).id

# Basic HTML: questions/answers
question_id = Question.create(
  body: 'О чем говорит тэг <p align="right"> … </p>?',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Текст, заключенный в тэг, будет расположен по центру страницы',
  question_id: question_id
)
Answer.create(
  body: 'Текст, заключенный в тэг, будет расположен по левому краю страницы',
  question_id: question_id
)
Answer.create(
  body: 'Текст, заключенный в тэг, будет расположен по правому краю страницы',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Какие единицы измерения могут использоваться для атрибута ширины?',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Пиксели и %',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Миллиметры и сантиметры',
  question_id: question_id
)
Answer.create(
  body: 'Пиксели и миллиметры',
  question_id: question_id
)
question_id = Question.create(
  body: 'Использование тэга … позволяет добавлять одну строку текста без начала
  нового абзаца:'.gsub("\n ", ''),
  test_id: html_basic_id
).id
Answer.create(
  body: '<line/>',
  question_id: question_id
)
Answer.create(
  body: '<br/>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<td/>',
  question_id: question_id
)
question_id = Question.create(
  body: 'Объясните смысл кода, представленного ниже:
<table>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Будет создана таблица, состоящая из 1 ряда и 3 колонок',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Будет создана таблица, состоящая из 3 рядов и 1 колонки',
  question_id: question_id
)
Answer.create(
  body: 'Будет создана таблица, состоящая из 2 рядов и 3 колонок',
  question_id: question_id
)
question_id = Question.create(
  body: 'Выберите код HTML, который бы создавал кнопку отправки заполненной формы.
  Имя кнопки – ОК'.gsub("\n ", ''),
  test_id: html_basic_id
).id
Answer.create(
  body: '<input type="ОК" value="Submit"/>',
  question_id: question_id
)
Answer.create(
  body: '<p> input type="submit" value="OK" </p>',
  question_id: question_id
)
Answer.create(
  body: '<input type="submit" value="ОК"/>',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой тэг при создании страницы добавляет имя страницы, которое будет
  отображаться в строке заголовка в браузере пользователя?'.gsub("\n ", ''),
  test_id: html_basic_id
).id
Answer.create(
  body: '<title> … </title>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<header> … </header>',
  question_id: question_id
)
Answer.create(
  body: '<body> … </body>',
  question_id: question_id
)
question_id = Question.create(
  body: 'Заполните поля, чтобы отобразить картинку “flower.jpg” с высотой 300
  пикселей и шириной 750 пикселей:'.gsub("\n ", ''),
  test_id: html_basic_id
).id
Answer.create(
  body: '<img ref=”flower” format=.jpg
high=300 px
width=750 px />',
  question_id: question_id
)
Answer.create(
  body: '<src img=”flower.jpg”
height=”300%”
width=”750%”/>',
  question_id: question_id
)
Answer.create(
  body: '<img src=”flower.jpg”
height=”300 px” alt=””
width=”750 px”/>',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Что содержит в себе атрибут href?',
  test_id: html_basic_id
).id
Answer.create(
  body: 'URL страницы, на которую произойдет перенаправление',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Имя страницы, на которую произойдет перенаправление',
  question_id: question_id
)
Answer.create(
  body: 'Указание на то, где будет открываться новая страница: в том же или новом
  окне'.gsub("\n ", ''),
  question_id: question_id
)
question_id = Question.create(
  body: 'Какие из перечисленных тэгов относятся к созданию таблицы?',
  test_id: html_basic_id
).id
Answer.create(
  body: '<header> <body> <footer>',
  question_id: question_id
)
Answer.create(
  body: '<table> <tr> <td>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<ul> <li> <tr> <td>',
  question_id: question_id
)
question_id = Question.create(
  body: 'Укажите тэг, который соответствует элементу списка:',
  test_id: html_basic_id
).id
Answer.create(
  body: '<li>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<ul>',
  question_id: question_id
)
Answer.create(
  body: '<ol>',
  question_id: question_id
)
question_id = Question.create(
  body: 'О чем говорит следующая запись: <form action="url" method="POST">?',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Создается форма, при заполнении которой вводимые данные будут отображаться',
  question_id: question_id
)
Answer.create(
  body: 'Создается форма, при заполнении которой вводимые данные не будут отображаться',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Создается форма, которая будет служить для внесения информации,
  представленной в виде ссылки (URL)'.gsub("\n ", ''),
  question_id: question_id
)
question_id = Question.create(
  body: 'Какое значение следует задать атрибуту type, чтобы оно превращало входной
  тэг в форму отправки?'.gsub("\n ", ''),
  test_id: html_basic_id
).id
Answer.create(
  body: 'Submit',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Checkbox',
  question_id: question_id
)
Answer.create(
  body: 'Radiobutton',
  question_id: question_id
)
question_id = Question.create(
  body: 'Для задания размеров тэгу <frameset> требуются следующие атрибуты:',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Высота и ширина',
  question_id: question_id
)
Answer.create(
  body: 'Площадь и толщина границ',
  question_id: question_id
)
Answer.create(
  body: 'Строки и столбцы',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Выберите верное утверждение:',
  test_id: html_basic_id
).id
Answer.create(
  body: 'В HTML цвета задаются комбинацией значений шестнадцатеричной системы
  исчисления: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, A, B, C, D, E, F'.gsub("\n ", ''),
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'В HTML цвета задаются комбинацией значений двоичной системы исчисления: 0
  или 1'.gsub("\n ", ''),
  question_id: question_id
)
Answer.create(
  body: 'В HTML цвета задаются комбинацией значений восьмеричной системы исчисления:
  0, 1, 2, 3, 4, 5, 6, 7'.gsub("\n ", ''),
  question_id: question_id
)
question_id = Question.create(
  body: 'Какие тэги делают шрифт текста жирным?',
  test_id: html_basic_id
).id
Answer.create(
  body: '<ins> и <del>',
  question_id: question_id
)
Answer.create(
  body: '<li> и <ul>',
  question_id: question_id
)
Answer.create(
  body: '<b> и <strong>',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Какие тэги используются для определения заголовков?',
  test_id: html_basic_id
).id
Answer.create(
  body: 'h1-h6',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Header',
  question_id: question_id
)
Answer.create(
  body: 'Heading',
  question_id: question_id
)
question_id = Question.create(
  body: 'Неотображаемые комментарии в HTML задаются следующим образом:',
  test_id: html_basic_id
).id
Answer.create(
  body: '<! - Your comment -!>',
  question_id: question_id
)
Answer.create(
  body: '<! - - Your comment - -!>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<!p> Your comment </!p>',
  question_id: question_id
)
question_id = Question.create(
  body: 'Что означает следующий код:
<a href="http://www.sololern.com" target="_blank">
  Learn Playing
</a>',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Переход по ссылке произойдет на новой странице',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Переход по ссылке произойдет на текущей странице',
  question_id: question_id
)
Answer.create(
  body: 'На текущей странице появится текст «Learn Playing»',
  question_id: question_id
)
question_id = Question.create(
  body: 'Перечислите основные модули контента, существующие в HTML 5.',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Image, Media, Metadata, Link, Heading, Color, Input Value',
  question_id: question_id
)
Answer.create(
  body: 'Metadata, Embedded, Interactive, Heading, Phrasing, Flow, Sectioning',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Flow, Static, Link, Header, Body, Footer, Processing, Chase',
  question_id: question_id
)
question_id = Question.create(
  body: 'Укажите, какой элемент HTML 5 отвечает за воспроизведение видео:',
  test_id: html_basic_id
).id
Answer.create(
  body: '<video>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<media>',
  question_id: question_id
)
Answer.create(
  body: '<movie>',
  question_id: question_id
)
question_id = Question.create(
  body: 'Элемент <canvas> используется для:',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Прикрепления таблиц Excel',
  question_id: question_id
)
Answer.create(
  body: 'Управления данными в базе данных',
  question_id: question_id
)
Answer.create(
  body: 'Прорисовки графики',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой тэг содержит навигацию?',
  test_id: html_basic_id
).id
Answer.create(
  body: '<nav>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<geo>',
  question_id: question_id
)
Answer.create(
  body: '<metanav>',
  question_id: question_id
)
question_id = Question.create(
  body: 'SessionStorage – это клиентское решение в HTML 5, которое позволяет:',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Извлекать и использовать данные предыдущих сессий при условии того, что не
  были очищены cash и cookie'.gsub("\n ", ''),
  question_id: question_id
)
Answer.create(
  body: 'Создавать базу данных решений пользователей в памяти браузера',
  question_id: question_id
)
Answer.create(
  body: 'Извлекать и использовать данные только текущей сессии',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Что создастся при исполнении следующего кода:
<svg width="75" height="75">
<line x1="50" y1="0" x2="50" y2="100"
style="stroke:black" />
<line x1="0" y1="50" x2="100" y2="50"
style="stroke:black" />
</svg> ?',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Знак «плюс»',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Знак «минус»',
  question_id: question_id
)
Answer.create(
  body: 'Знак «равно»',
  question_id: question_id
)
question_id = Question.create(
  body: 'Функция HTML 5 navigation.geolocation.getCurrentPosition() возвращает:',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Встроенную в основной функционал сайта карту мира',
  question_id: question_id
)
Answer.create(
  body: 'Данные о местонахождении пользователя',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Данные о местонахождении сервера',
  question_id: question_id
)
question_id = Question.create(
  body: 'Заполните пропуски таким образом, чтобы получился валидный HTML документ.
  «First paragraph» - комментарий.
<___>
<body>
<! - - First paragraph ___>
<___> This is the first paragraph! </p>
<___>
</html>'.gsub("\n ", ''),
  test_id: html_basic_id
).id
Answer.create(
  body: 'html/; - - ?; p; /body',
  question_id: question_id
)
Answer.create(
  body: 'html v.5; - - !; /p; /body',
  question_id: question_id
)
Answer.create(
  body: 'html; - - !; p; /body',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'HTML – это',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Язык разметки',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Библиотека гипертекста',
  question_id: question_id
)
Answer.create(
  body: 'Скриптовый язык',
  question_id: question_id
)
question_id = Question.create(
  body: 'Обязательно ли использование тэгов <html> … </html>?',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Да, без них браузер не распознает HTML-документ',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Да, если HTML-документ создается в блокноте или другом текстовом редакторе.
  В специальном компиляторе HTML эти тэги можно не использовать'.gsub("\n ", ''),
  question_id: question_id
)
Answer.create(
  body: 'Не обязательно',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой атрибут позволяет объединить ячейки таблицы по вертикали?',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Union',
  question_id: question_id
)
Answer.create(
  body: 'Colspan',
  question_id: question_id
)
Answer.create(
  body: 'Rowspan',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Допустимое число заголовков первого уровня в HTML-документе составляет:',
  test_id: html_basic_id
).id
Answer.create(
  body: '1',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '3',
  question_id: question_id
)
Answer.create(
  body: '7',
  question_id: question_id
)
question_id = Question.create(
  body: 'Текст, выделенный курсивом, представлен в следующей записи:',
  test_id: html_basic_id
).id
Answer.create(
  body: '<del> курсив </del>',
  question_id: question_id
)
Answer.create(
  body: '<i> курсив </i>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<hr> курсив </hr>',
  question_id: question_id
)
question_id = Question.create(
  body: 'В HTML не существует … тэгов:',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Одиночных',
  question_id: question_id
)
Answer.create(
  body: 'Парных',
  question_id: question_id
)
Answer.create(
  body: 'Тройных',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'При создании сайтов используют кодировку:',
  test_id: html_basic_id
).id
Answer.create(
  body: 'UTF8',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'ASCII',
  question_id: question_id
)
Answer.create(
  body: 'UTF-32',
  question_id: question_id
)
question_id = Question.create(
  body: 'HTML-документ может иметь расширения:',
  test_id: html_basic_id
).id
Answer.create(
  body: '.html',
  question_id: question_id
)
Answer.create(
  body: '.html или .htm',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '.html или .txt',
  question_id: question_id
)
question_id = Question.create(
  body: 'Укажите устаревшие тэги для HTML 5:',
  test_id: html_basic_id
).id
Answer.create(
  body: '<applet>, <blink>, <u>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<ul>, <audio>, <pre>',
  question_id: question_id
)
Answer.create(
  body: '<code>, <s>, <embed>',
  question_id: question_id
)
question_id = Question.create(
  body: 'Тэг, подключающий к существующему HTML-документу скрипты, которые
  выполняются на клиентской стороне – это:'.gsub("\n ", ''),
  test_id: html_basic_id
).id
Answer.create(
  body: '<object>',
  question_id: question_id
)
Answer.create(
  body: '<script>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<client>',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой символ обозначает конец тэга?',
  test_id: html_basic_id
).id
Answer.create(
  body: '^',
  question_id: question_id
)
Answer.create(
  body: ';',
  question_id: question_id
)
Answer.create(
  body: '/',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Список, в котором элементы перечисления отмечаются буллетами, позволяет
  создать тэг:'.gsub("\n ", ''),
  test_id: html_basic_id
).id
Answer.create(
  body: '<ul>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<ol>',
  question_id: question_id
)
Answer.create(
  body: '<bl>',
  question_id: question_id
)
question_id = Question.create(
  body: 'Укажите корректную запись для создания чек-бокса:',
  test_id: html_basic_id
).id
Answer.create(
  body: '<input checkbox>',
  question_id: question_id
)
Answer.create(
  body: '<type input=”checkbox”>',
  question_id: question_id
)
Answer.create(
  body: '<input type=”checkbox”>',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Укажите корректную запись для создания выпадающего списка:',
  test_id: html_basic_id
).id
Answer.create(
  body: '<input type=”dropdown”>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<input dropdown list>',
  question_id: question_id
)
Answer.create(
  body: '<dropdown list>',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой атрибут HTML указывает альтернативный текст для изображения, если
  данное изображение не отобразится?'.gsub("\n ", ''),
  test_id: html_basic_id
).id
Answer.create(
  body: 'imgalt',
  question_id: question_id
)
Answer.create(
  body: 'imgvar',
  question_id: question_id
)
Answer.create(
  body: 'alt',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой HTML-тэг используется для определения футера документа или раздела?',
  test_id: html_basic_id
).id
Answer.create(
  body: '<footer>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<bottom>',
  question_id: question_id
)
Answer.create(
  body: '<section>',
  question_id: question_id
)
question_id = Question.create(
  body: 'HTML-тэг, позволяющий воспроизводить аудиозаписи – это:',
  test_id: html_basic_id
).id
Answer.create(
  body: '<music>',
  question_id: question_id
)
Answer.create(
  body: '<audio>',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<sound>',
  question_id: question_id
)
question_id = Question.create(
  body: 'В HTML 5, onblur и onfocus – это:',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Атрибуты событий',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Атрибуты стиля',
  question_id: question_id
)
Answer.create(
  body: 'Атрибуты подключения базы данных',
  question_id: question_id
)
question_id = Question.create(
  body: 'Графика, определенная SVG, отображается в формате:',
  test_id: html_basic_id
).id
Answer.create(
  body: 'CSS',
  question_id: question_id
)
Answer.create(
  body: 'JSOM',
  question_id: question_id
)
Answer.create(
  body: 'XML',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Что определяет тэг <aside>?',
  test_id: html_basic_id
).id
Answer.create(
  body: 'Дополнительное содержимое, т.е. то, что не включает основной документ',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Ссылку на подключенный документ',
  question_id: question_id
)
Answer.create(
  body: 'Цветовое решение документа',
  question_id: question_id
)

# Basic Ruby: questions/answers
question_id = Question.create(
  body: 'Где записана сокращенная форма кода ниже:
x = x / 3',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'x /= 3 ',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Нет сокращенной формы',
  question_id: question_id
)
Answer.create(
  body: 'x = / 3',
  question_id: question_id
)
question_id = Question.create(
  body: 'Чем отличается puts от print:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Ничем, оба делают одно и тоже',
  question_id: question_id
)
Answer.create(
  body: 'print без пропуска строки, а puts с пропуском ',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'puts позволяет выводить переменные, а print только текст',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой метод позволяет перевести строку в нижний регистр:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'lowercase()',
  question_id: question_id
)
Answer.create(
  body: 'dcase()',
  question_id: question_id
)
Answer.create(
  body: 'downcase()',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Что выведет этот код:
some = 25
print(“Переменная: ” + some)',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Выведет: “Переменная: some”',
  question_id: question_id
)
Answer.create(
  body: 'Выведет: “Переменная: 25”',
  question_id: question_id
)
Answer.create(
  body: 'Будет выведена ошибка',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Где указана пустая переменная (без какого-либо значения):',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'some = 0',
  question_id: question_id
)
Answer.create(
  body: 'some = nil',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'some = “”',
  question_id: question_id
)
question_id = Question.create(
  body: 'В каком варианте вы получите число без пропуска строки от пользователя:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'num = gets',
  question_id: question_id
)
Answer.create(
  body: 'num = gets.chomp()',
  question_id: question_id
)
Answer.create(
  body: 'um = gets.chomp().to_i ',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Как называется самый популярный фреймворк Ruby для веба:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Ruby On Rails',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Ruby Web',
  question_id: question_id
)
Answer.create(
  body: 'Ruby Framework',
  question_id: question_id
)
question_id = Question.create(
  body: 'Что покажет этот код:
num = -6
num *= 2
num = num. abs()
res = Math. sqrt(num * 12)
print(“Результат: ” + res. round(). to_s)',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Выведет: Ошибку',
  question_id: question_id
)
Answer.create(
  body: 'Выведет: “Результат: -12”',
  question_id: question_id
)
Answer.create(
  body: 'Выведет: “Результат: 12”',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Сработает ли данный код:
print(“Введите имя: “)
name = gets
puts(“Имя: ” + name)',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Необходимо дописать gets.chomp()',
  question_id: question_id
)
Answer.create(
  body: 'Код сработает в любом случае',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Код сработает только если введут строку, а не число',
  question_id: question_id
)
question_id = Question.create(
  body: 'Динамический, рефлективный, интерпретируемый высокоуровневый язык
  программирования:'.gsub("\n ", ''),
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Ruby',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Dylan',
  question_id: question_id
)
Answer.create(
  body: 'Scala',
  question_id: question_id
)
question_id = Question.create(
  body: 'Язык обладает независимой от операционной системы реализацией:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'одноточности',
  question_id: question_id
)
Answer.create(
  body: 'многопоточности',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'релевантности',
  question_id: question_id
)
question_id = Question.create(
  body: 'По особенностям синтаксиса он близок к языку:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Perl',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Dylan',
  question_id: question_id
)
Answer.create(
  body: 'Scala',
  question_id: question_id
)
question_id = Question.create(
  body: 'По объектно-ориентированному подходу близок к:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Smalltalk',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Scala',
  question_id: question_id
)
Answer.create(
  body: 'Dylan',
  question_id: question_id
)
question_id = Question.create(
  body: 'Некоторые черты языка взяты из:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Perl',
  question_id: question_id
)
Answer.create(
  body: 'Scala',
  question_id: question_id
)
Answer.create(
  body: 'Lisp',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Создатель Ruby:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Билл Гейтц',
  question_id: question_id
)
Answer.create(
  body: 'Марк Цукербург',
  question_id: question_id
)
Answer.create(
  body: 'Юкихиро Мацумото (Matz)',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'В Японии Ruby стал популярным с момента появления первой общедоступной
  версии в:'.gsub("\n ", ''),
  test_id: ruby_basic_id
).id
Answer.create(
  body: '2005 году',
  question_id: question_id
)
Answer.create(
  body: '1995 году ',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '1999 году',
  question_id: question_id
)
question_id = Question.create(
  body: 'Ruby – полностью такой язык:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Специфический',
  question_id: question_id
)
Answer.create(
  body: 'Объектно-ориентированный',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Ориентировочно-последовательный',
  question_id: question_id
)
question_id = Question.create(
  body: 'Ruby использует вызов по соиспользованию (call-by-sharing), хотя в
  сообществе Ruby часто говорят, что он использует вызов по:'.gsub("\n ", ''),
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Вычислению',
  question_id: question_id
)
Answer.create(
  body: 'Памяти',
  question_id: question_id
)
Answer.create(
  body: 'Ссылке',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Ruby не поддерживает множественное наследование, но вместо него есть мощный
  механизм:'.gsub("\n ", ''),
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Фактов',
  question_id: question_id
)
Answer.create(
  body: 'Примесей',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Тем',
  question_id: question_id
)
question_id = Question.create(
  body: 'Ruby является таким языком:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'максипарадигменным',
  question_id: question_id
)
Answer.create(
  body: 'парадигменным',
  question_id: question_id
)
Answer.create(
  body: 'мультипарадигменным',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Ruby поддерживает такой стиль:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'динамический',
  question_id: question_id
)
Answer.create(
  body: 'процедурный',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'процессуальный',
  question_id: question_id
)
question_id = Question.create(
  body: 'Ruby позволяет обрабатывать исключения в стиле:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'Java',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Perl',
  question_id: question_id
)
Answer.create(
  body: 'Eiffel',
  question_id: question_id
)
question_id = Question.create(
  body: 'Ruby позволяет переопределять операторы, которые на самом деле являются:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'методами',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'способами',
  question_id: question_id
)
Answer.create(
  body: 'данными',
  question_id: question_id
)
question_id = Question.create(
  body: 'Ruby может динамически загружать расширения, если это позволяет:',
  test_id: ruby_basic_id
).id
Answer.create(
  body: 'память',
  question_id: question_id
)
Answer.create(
  body: 'операционная система',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'интернет',
  question_id: question_id
)

# Basic Java: questions/answers
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a + 2);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '52',
  question_id: question_id
)
Answer.create(
  body: '7',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '5+2',
  question_id: question_id
)
Answer.create(
  body: 'unhandled exception ',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a + "2");
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '52',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '7',
  question_id: question_id
)
Answer.create(
  body: '5+2',
  question_id: question_id
)
Answer.create(
  body: 'unhandled exception ',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a / 2);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '2',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '1',
  question_id: question_id
)
Answer.create(
  body: '2.5',
  question_id: question_id
)
Answer.create(
  body: 'unhandled exception',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a / 2.0);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '2',
  question_id: question_id
)
Answer.create(
  body: '1',
  question_id: question_id
)
Answer.create(
  body: '2.5',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'unhandled exception',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int a = 5;
System.out.println(a % 2);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '2',
  question_id: question_id
)
Answer.create(
  body: '1',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '2.5',
  question_id: question_id
)
Answer.create(
  body: 'unhandled exception',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
double a = 5;
System.out.println(a / 2);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '2',
  question_id: question_id
)
Answer.create(
  body: '1',
  question_id: question_id
)
Answer.create(
  body: '2.5',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'unhandled exception',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
double a = 5;
System.out.println((int) a / 2);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '2',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '1',
  question_id: question_id
)
Answer.create(
  body: '2.5',
  question_id: question_id
)
Answer.create(
  body: 'unhandled exception',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{11, 5, -4, 8, 4, 7};
for (int i = 0; i < array.length; i += 2) {
System.out.print(array[i]+" ");
}
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '11 -4 4',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '0 2 4',
  question_id: question_id
)
Answer.create(
  body: 'ArrayIndexOutOfBoundsException',
  question_id: question_id
)
Answer.create(
  body: '11',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{11, 5, -4, 8, 4, 7};
for (int i = 0; i < array.length; i += 2) {
System.out.print(i+" ");
}
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '11 -4 4',
  question_id: question_id
)
Answer.create(
  body: '0 2 4',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'ArrayIndexOutOfBoundsException',
  question_id: question_id
)
Answer.create(
  body: '11',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{11, 5, -4, 8, 4, 7};
for (int i = 0; i <= array.length; i += 2) {
System.out.print(array[i] + " ");
}
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '11 -4 4',
  question_id: question_id
)
Answer.create(
  body: '0 2 4',
  question_id: question_id
)
Answer.create(
  body: 'ArrayIndexOutOfBoundsException',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '11',
  question_id: question_id
)
question_id = Question.create(
  body: 'Что выполняет данный код?
public static void main(String[] args) {
int z = 0;
int number = 452;
while (number > 0) {
z += number % 10;
number /= 10;
}
System.out.println(z);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: 'выводит на консоль сумму цифр числа',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'выводит на консоль количество цифр числа',
  question_id: question_id
)
Answer.create(
  body: 'выводит на консоль сумму остатков от деления на 10 всех цифр числа',
  question_id: question_id
)
Answer.create(
  body: 'выводит на консоль число в обратном порядке',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int x = -2, y = 5, z;
z = x > y ? x : y;
System.out.println(z);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '-2',
  question_id: question_id
)
Answer.create(
  body: '5',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '3',
  question_id: question_id
)
Answer.create(
  body: '7',
  question_id: question_id
)
question_id = Question.create(
  body: 'Дан код:
public static void main(String[] args) {
int x = -2, y = 5, max;
// добавьте код
System.out.println(max);
}
Какой из предложенных ниже фрагментов кода выведет на консоль максимальное число?',
  test_id: java_basic_id
).id
Answer.create(
  body: 'max = x < y ? x : y;',
  question_id: question_id
)
Answer.create(
  body: 'max = x > y ? x : y;',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'if (x > y) max = x; else max = y;',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'if (x < y) max = x; else max = y;',
  question_id: question_id
)
question_id = Question.create(
  body: '--х;',
  test_id: java_basic_id
).id
Answer.create(
  body: 'постфиксный инкремент',
  question_id: question_id
)
Answer.create(
  body: 'префиксный инкремент',
  question_id: question_id
)
Answer.create(
  body: 'постфиксный декремент',
  question_id: question_id
)
Answer.create(
  body: 'префиксный декремент',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Что из нижеперечисленного является примитивным типом данных?',
  test_id: java_basic_id
).id
Answer.create(
  body: 'int[]',
  question_id: question_id
)
Answer.create(
  body: 'int',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'char',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Boolean',
  question_id: question_id
)
Answer.create(
  body: 'Integer',
  question_id: question_id
)
Answer.create(
  body: 'String',
  question_id: question_id
)
question_id = Question.create(
  body: 'Как указать индекс последнего элемента массива?',
  test_id: java_basic_id
).id
Answer.create(
  body: 'array.length;',
  question_id: question_id
)
Answer.create(
  body: 'array.size;',
  question_id: question_id
)
Answer.create(
  body: 'array.length-1;',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'array.size-1;',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[]{15, 5, -8, -6, 0, 7};
System.out.println(array[array.length - 1]);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '0',
  question_id: question_id
)
Answer.create(
  body: '7',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '6',
  question_id: question_id
)
Answer.create(
  body: '5',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int[] array = new int[3];
System.out.println(array[2]);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '0',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '1',
  question_id: question_id
)
Answer.create(
  body: '2',
  question_id: question_id
)
Answer.create(
  body: 'ArrayIndexOutOfBoundsException',
  question_id: question_id
)
Answer.create(
  body: 'null',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String[] array = new String[3];
System.out.println(array[2]);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '0',
  question_id: question_id
)
Answer.create(
  body: '1',
  question_id: question_id
)
Answer.create(
  body: '2',
  question_id: question_id
)
Answer.create(
  body: 'ArrayIndexOutOfBoundsException',
  question_id: question_id
)
Answer.create(
  body: 'null',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Выберите правильный вариант записи операции сравнения?',
  test_id: java_basic_id
).id
Answer.create(
  body: '0<=x;',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'x>=0;',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'x=>0;',
  question_id: question_id
)
Answer.create(
  body: '0=<x;',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String s = "Hello";
System.out.println(s + 5 + 4);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: 'Hello54',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Hello9',
  question_id: question_id
)
Answer.create(
  body: 'Hello 5 4',
  question_id: question_id
)
Answer.create(
  body: 'Hello 54',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String s = "Hello";
System.out.println(s + (5 + 4));
}',
  test_id: java_basic_id
).id
Answer.create(
  body: 'Hello54',
  question_id: question_id
)
Answer.create(
  body: 'Hello9',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Hello 5 4',
  question_id: question_id
)
Answer.create(
  body: 'Hello 54',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
System.out.println(1.0 / 0);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: 'Infinity',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'NAN',
  question_id: question_id
)
Answer.create(
  body: 'ArithmeticException: / by zero',
  question_id: question_id
)
Answer.create(
  body: 'не позволит запустить код на выполнение',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой модификатор доступа необходимо использовать, чтобы переменная была
  видна только в текущем классе?'.gsub("\n ", ''),
  test_id: java_basic_id
).id
Answer.create(
  body: 'public',
  question_id: question_id
)
Answer.create(
  body: 'private',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'protected',
  question_id: question_id
)
Answer.create(
  body: 'default (package visible) ',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой модификатор доступа необходимо использовать, чтобы переменная была
  видна везде?'.gsub("\n ", ''),
  test_id: java_basic_id
).id
Answer.create(
  body: 'public',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'private',
  question_id: question_id
)
Answer.create(
  body: 'protected',
  question_id: question_id
)
Answer.create(
  body: 'default (package visible) ',
  question_id: question_id
)
question_id = Question.create(
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
решения.'.gsub("\n ", ''),
  test_id: java_basic_id
).id
Answer.create(
  body: 'while ((z >= 0) && (z <= 15))',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'while ((z >= 0) & (z <= 15))',
  question_id: question_id
)
Answer.create(
  body: 'while ((z >= 0) || (z <= 15))',
  question_id: question_id
)
Answer.create(
  body: 'while ((z >= 0) != (z <= 15))',
  question_id: question_id
)
Answer.create(
  body: 'while ((z >= 0) == (z <= 15))',
  question_id: question_id
)
Answer.create(
  body: 'while ((z >= 0) == (z <= 15))',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int x = 125_121_148;
System.out.println(++x);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: 'ошибка на этапе компиляции',
  question_id: question_id
)
Answer.create(
  body: 'ошибка во время выполнения',
  question_id: question_id
)
Answer.create(
  body: '125121149',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '125121148',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String test = "Hello";
String test2 = "Hello";
System.out.println(test==test2);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: 'true',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'false',
  question_id: question_id
)
Answer.create(
  body: 'Hello',
  question_id: question_id
)
Answer.create(
  body: 'null',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
String test = new String("Hello");
String test2 = new String("Hello");
System.out.println(test==test2);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: 'true',
  question_id: question_id
)
Answer.create(
  body: 'false',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Hello',
  question_id: question_id
)
Answer.create(
  body: 'null',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного фрагмента кода?
for(;;) {
}',
  test_id: java_basic_id
).id
Answer.create(
  body: 'бесконечный цикл',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'ошибка на этапе компиляции',
  question_id: question_id
)
Answer.create(
  body: 'ошибка на этапе выполнения',
  question_id: question_id
)
Answer.create(
  body: 'этот код никогда не выполнится',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
int sum = 0;
for (int i = 1; i <= 3; sum += i++) ;
System.out.println(sum);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '6',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '3',
  question_id: question_id
)
Answer.create(
  body: 'compile error',
  question_id: question_id
)
Answer.create(
  body: '5',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
byte x = 127;
x += 2;
System.out.println(x);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '-127',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '129',
  question_id: question_id
)
Answer.create(
  body: 'runtime error',
  question_id: question_id
)
Answer.create(
  body: 'compile error',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой результат работы данного кода?
public static void main(String[] args) {
byte x = -128;
x -= 2;
System.out.println(x);
}',
  test_id: java_basic_id
).id
Answer.create(
  body: '126',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '-130',
  question_id: question_id
)
Answer.create(
  body: '2',
  question_id: question_id
)
Answer.create(
  body: 'compile error',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какие из следующих объявлений переменных верны?',
  test_id: java_basic_id
).id
Answer.create(
  body: 'int 1x;',
  question_id: question_id
)
Answer.create(
  body: 'double t; int x;',
  question_id: question_id
)
Answer.create(
  body: 'int f,f;',
  question_id: question_id
)
Answer.create(
  body: 'int x,X; double a; a1;',
  question_id: question_id
)
Answer.create(
  body: 'String book1; book2;',
  question_id: question_id
)
Answer.create(
  body: 'char symbol1,symbol2,symbol_3;',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'int x,a,b; double y,z,x;',
  question_id: question_id
)
Answer.create(
  body: 'int x; double X;',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Выберите вариант объявления массива в стиле Java:',
  test_id: java_basic_id
).id
Answer.create(
  body: 'String [] birthdays = new String[10];',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'String birthdays [] = new String[10];',
  question_id: question_id
)
Answer.create(
  body: 'String birthdays [] = String[10];',
  question_id: question_id
)
Answer.create(
  body: 'String birthdays = String[];',
  question_id: question_id
)

# Basic Java Script: questions/answers
question_id = Question.create(
  body: 'Какую функцию нужно использовать, чтобы пользователь мог ввести свой текст
  (ответ) в окошке?'.gsub("\n ", ''),
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'print',
  question_id: question_id
)
Answer.create(
  body: 'prompt',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'confirm',
  question_id: question_id
)
Answer.create(
  body: 'setTimeout',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какую функцию нужно использовать, чтобы вывести на экран текст в окошке?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'setInterval',
  question_id: question_id
)
Answer.create(
  body: 'history',
  question_id: question_id
)
Answer.create(
  body: 'alert',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'open',
  question_id: question_id
)
question_id = Question.create(
  body: 'Что в строке ниже?
var a;',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'функция',
  question_id: question_id
)
Answer.create(
  body: 'переменная',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'команда',
  question_id: question_id
)
Answer.create(
  body: 'оператор',
  question_id: question_id
)
question_id = Question.create(
  body: 'В какой строке ошибка?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'var a;',
  question_id: question_id
)
Answer.create(
  body: 'var a = 3;',
  question_id: question_id
)
Answer.create(
  body: 'var = 3;',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'a = 3;',
  question_id: question_id
)
question_id = Question.create(
  body: 'Для чего нужна строка?
var username = prompt("Ваше имя");',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'Создать переменную и записать в неё имя, которое вводит пользователь',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Вывести имя пользователя на экран',
  question_id: question_id
)
Answer.create(
  body: 'Создать пустую переменную',
  question_id: question_id
)
Answer.create(
  body: 'Спросить у пользователя его имя',
  question_id: question_id
)
question_id = Question.create(
  body: 'С помощью какого оператора можно найти остаток от деления?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: '**',
  question_id: question_id
)
Answer.create(
  body: '%',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '--',
  question_id: question_id
)
Answer.create(
  body: '?',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой оператор прибавляет к числу единицу?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: '--',
  question_id: question_id
)
Answer.create(
  body: '++',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '&&',
  question_id: question_id
)
Answer.create(
  body: '||',
  question_id: question_id
)
question_id = Question.create(
  body: 'Как преобразовать введённую строку в число?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'var a = Number(prompt("Введите число"))',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'var a = (Number)(prompt("Введите число"))',
  question_id: question_id
)
Answer.create(
  body: 'var a = (Number)prompt("Введите число")',
  question_id: question_id
)
Answer.create(
  body: 'var a = prompt("Введите число")',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой оператор определит, равны ли две переменные?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: '<',
  question_id: question_id
)
Answer.create(
  body: '>',
  question_id: question_id
)
Answer.create(
  body: '=',
  question_id: question_id
)
Answer.create(
  body: '<=',
  question_id: question_id
)
Answer.create(
  body: '>=',
  question_id: question_id
)
Answer.create(
  body: '==',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой оператор поможет определить, что две переменные НЕ равны друг другу?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: '<',
  question_id: question_id
)
Answer.create(
  body: '>',
  question_id: question_id
)
Answer.create(
  body: '!=',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '<=',
  question_id: question_id
)
Answer.create(
  body: '>=',
  question_id: question_id
)
Answer.create(
  body: '==',
  question_id: question_id
)
question_id = Question.create(
  body: 'С какого слова начинается условие?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'else',
  question_id: question_id
)
Answer.create(
  body: 'loop',
  question_id: question_id
)
Answer.create(
  body: 'if',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'then',
  question_id: question_id
)
Answer.create(
  body: 'begin',
  question_id: question_id
)
Answer.create(
  body: 'function',
  question_id: question_id
)
Answer.create(
  body: 'for',
  question_id: question_id
)
question_id = Question.create(
  body: 'Пользователь вводит два числа, нужно определить какое из них больше. В каком
  варианте задача решена верно?'.gsub("\n ", ''),
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'var a = Number(prompt("Число 1: "));
var b= Number(prompt("Число 2: "));
if (a>b)
alert ("Наибольшее: "+a);
else alert ("Наибольшее: "+b);',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'var a = prompt("Число 1: ");
var b= prompt("Число 2: ");
if (a>b)
alert ("Наибольшее: "+a);
else alert ("Наибольшее: "+b);',
  question_id: question_id
)
Answer.create(
  body: 'Number(prompt("Число 1: "));
Number(prompt("Число 2: "));
if (a>b)
alert ("Наибольшее: "+a);
else alert ("Наибольшее: "+b);',
  question_id: question_id
)
Answer.create(
  body: 'var a = Number(prompt("Число 1: "));
var b= Number(prompt("Число 2: "));
if (a>b)
alert ("Наибольшее: "+a);',
  question_id: question_id
)
question_id = Question.create(
  body: 'В каких вариантах при создании условия допущена ошибка?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'if (a > b)
alert(“Наибольшее ” + a);',
  question_id: question_id
)
Answer.create(
  body: 'if (a < b)
alert(“Наименьшее ” + a);
else alert(“Наименьшее ” + b);',
  question_id: question_id
)
Answer.create(
  body: 'if (a==b)
{
alert(“Числа равны”);
с = a + b;
}',
  question_id: question_id
)
Answer.create(
  body: '(a > b)
alert(“Наибольшее ” + a);',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'if a > b
alert(“Наибольшее ” + a);',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'С какого слова начинается цикл?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'else',
  question_id: question_id
)
Answer.create(
  body: 'loop',
  question_id: question_id
)
Answer.create(
  body: 'if',
  question_id: question_id
)
Answer.create(
  body: 'then',
  question_id: question_id
)
Answer.create(
  body: 'begin',
  question_id: question_id
)
Answer.create(
  body: 'function',
  question_id: question_id
)
Answer.create(
  body: 'for',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'В каком варианте цикл создан верно?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'for (var i = 0; i < 10; i++) {
alert(“Цифра ” + i);
}',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'for (i = 0; i < 10; i++) {
alert(“Цифра ” + i);
}',
  question_id: question_id
)
Answer.create(
  body: 'for (var i == 0; i < 10; i++) {
alert(“Цифра ” + i);
}',
  question_id: question_id
)
Answer.create(
  body: 'for var i = 0; i < 10; i++ {
alert(“Цифра ” + i);
}',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какие бывают циклы в JavaScript? Отметьте все правильные варианты.',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'for',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'while',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'do...while',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'let',
  question_id: question_id
)
Answer.create(
  body: 'if',
  question_id: question_id
)
Answer.create(
  body: 'var',
  question_id: question_id
)
question_id = Question.create(
  body: 'Что такое массив?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'спископодобный элемент',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'переменная',
  question_id: question_id
)
Answer.create(
  body: 'свойство',
  question_id: question_id
)
question_id = Question.create(
  body: 'Что выполняется во второй строке кода?
var animals = [‘кошка’, ’собака’, ‘хомяк’];
animals.push(‘попугай’);',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'удаление элемента в конце массива',
  question_id: question_id
)
Answer.create(
  body: 'добавление элемента в конец массива',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'добавление элемента в начало массива',
  question_id: question_id
)
question_id = Question.create(
  body: 'Что выполняется во второй строке кода?
var animals = [‘кошка’, ’собака’, ‘хомяк’];
animals.pop();',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'удаление элемента в конце массива',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'добавление элемента в конец массива',
  question_id: question_id
)
Answer.create(
  body: 'удаление элемента в начале массива',
  question_id: question_id
)
question_id = Question.create(
  body: 'С какого слова начинается функция?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'else',
  question_id: question_id
)
Answer.create(
  body: 'loop',
  question_id: question_id
)
Answer.create(
  body: 'if',
  question_id: question_id
)
Answer.create(
  body: 'then',
  question_id: question_id
)
Answer.create(
  body: 'begin',
  question_id: question_id
)
Answer.create(
  body: 'function',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'for',
  question_id: question_id
)
question_id = Question.create(
  body: 'В какой строке происходит вызов функции perimeter?
Введите порядковый номер этой строки.
function perimeter (side) {
x = side * 4;
return x;
}
side = prompt(‘Введите сторону квадрата: ’);
p = perimeter(side);
alert(‘Периметр квадрата: ’ + p);',
  test_id: java_script_basic_id
).id
Answer.create(
  body: '2',
  question_id: question_id
)
Answer.create(
  body: '3',
  question_id: question_id
)
Answer.create(
  body: '6',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '9',
  question_id: question_id
)
question_id = Question.create(
  body: 'В каком варианте функция создана без ошибок?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'function square (side) {
x = side * side;
return x;
}',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'function (side) {
x = side * side;
return x;
}',
  question_id: question_id
)
Answer.create(
  body: 'function square (side)
x = side * side;
return x;',
  question_id: question_id
)
Answer.create(
  body: 'function square {
x = side * side;
return x;
}',
  question_id: question_id
)
question_id = Question.create(
  body: 'Для чего нужна функция getElementById()?',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'ввод текста',
  question_id: question_id
)
Answer.create(
  body: 'поиск элемента в HTML по его ID',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'добавление элемента в массив',
  question_id: question_id
)
Answer.create(
  body: 'поиск текста',
  question_id: question_id
)
question_id = Question.create(
  body: 'Что делает строка ниже?
document.getElementById(“p1”).innerHTML = “Привет!”;',
  test_id: java_script_basic_id
).id
Answer.create(
  body: 'ищет элемент в HTML',
  question_id: question_id
)
Answer.create(
  body: 'ищет элемент в HTML и удаляет в нём текст',
  question_id: question_id
)
Answer.create(
  body: 'удаляет элемент в HTML',
  question_id: question_id
)
Answer.create(
  body: 'ищет элемент в HTML и меняет в нём текст',
  correct: true,
  question_id: question_id
)

# Quiz: Planets: questions/answers
question_id = Question.create(
  body: 'Сколько спутников у Марса?',
  answer_explanation: 'У Марса два спутника: Фобос и Деймос.',
  test_id: quiz_planets_id
).id
Answer.create(
  body: '13',
  question_id: question_id
)
Answer.create(
  body: '2',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: '50',
  question_id: question_id
)
Answer.create(
  body: '1',
  question_id: question_id
)
question_id = Question.create(
  body: 'Самый большой вулкан Солнечной системы называется «Гора Олимп». Где он
  находится?'.gsub("\n ", ''),
  answer_explanation: 'Гора Олимп, крупнейший вулкан Солнечной системы находится на
  Марсе. Высота вулкана — 26 км от основания, диаметр — около 540 км.'.gsub("\n ", ''),
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'Юпитер',
  question_id: question_id
)
Answer.create(
  body: 'Земля',
  question_id: question_id
)
Answer.create(
  body: 'Венера',
  question_id: question_id
)
Answer.create(
  body: 'Марс',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Какая планета ближе всех расположена к Солнцу?',
  answer_explanation: 'Меркурий — ближайшая к Солнцу планета.',
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'Земля',
  question_id: question_id
)
Answer.create(
  body: 'Венера',
  question_id: question_id
)
Answer.create(
  body: 'Меркурий',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Нептун',
  question_id: question_id
)
question_id = Question.create(
  body: 'Большое красное пятно на Юпитере, что это?',
  answer_explanation: 'Большое красное пятно — это сильная буря в атмосфере Юпитера.',
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'вулкан',
  question_id: question_id
)
Answer.create(
  body: 'озеро',
  question_id: question_id
)
Answer.create(
  body: 'буря',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'кратер',
  question_id: question_id
)
question_id = Question.create(
  body: 'Из чего в основном состоит Солнце?',
  answer_explanation: 'Солнце в основном состоит из двух газов: водорода и гелия.',
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'жидкая лава',
  question_id: question_id
)
Answer.create(
  body: 'расплавленный метал',
  question_id: question_id
)
Answer.create(
  body: 'газ',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'камень',
  question_id: question_id
)
question_id = Question.create(
  body: 'Из чего в основном состоят кометы?',
  answer_explanation: 'Кометы в основном состоят из льда и пыли.',
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'ядовитая жидкость',
  question_id: question_id
)
Answer.create(
  body: 'лед и пыль',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'ржавый металл',
  question_id: question_id
)
Answer.create(
  body: 'расплавленный камень',
  question_id: question_id
)
question_id = Question.create(
  body: 'К какой планете принадлежат спутники Оберон и Титания?',
  answer_explanation: 'Оберон и Титания — два из 27 спутников Урана.',
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'Юпитер',
  question_id: question_id
)
Answer.create(
  body: 'Уран',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Венера',
  question_id: question_id
)
Answer.create(
  body: 'Земля',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какой из вариантов лучше всего описывает атмосферу, окружающую Венеру?',
  answer_explanation: 'Венера окружена кислотными облаками, а ее средняя температура
  на поверхности может достигать 735 К (462 °C). Поэтому самое подходящее описание
  атмосферы Венеры — горячая и ядовитая.'.gsub("\n ", ''),
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'яркая и солнечная',
  question_id: question_id
)
Answer.create(
  body: 'холодная и снежная',
  question_id: question_id
)
Answer.create(
  body: 'холодная и влажная',
  question_id: question_id
)
Answer.create(
  body: 'горячая и ядовитая',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Где находится пояс астероидов?',
  answer_explanation: 'Пояс астероидов находится в области между планетами Марс и
  Юпитер.'.gsub("\n ", ''),
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'между Юпитером и Сатурном',
  question_id: question_id
)
Answer.create(
  body: 'Землей и Венерой',
  question_id: question_id
)
Answer.create(
  body: 'Марсом и Юпитером',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Землей и Марсом',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какая из этих планет самая маленькая?',
  answer_explanation: 'Меркурий, его ширина составляет 4879 км.',
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'Юпитер',
  question_id: question_id
)
Answer.create(
  body: 'Уран',
  question_id: question_id
)
Answer.create(
  body: 'Земля',
  question_id: question_id
)
Answer.create(
  body: 'Меркурий',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Какие две планеты вращаются в обратном направлении от остальных?',
  answer_explanation: 'Уран и Венера',
  test_id: quiz_planets_id
).id
Answer.create(
  body: 'Уран и Венера',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Венера и Плутон',
  question_id: question_id
)
Answer.create(
  body: 'Меркурий и Юпитер',
  question_id: question_id
)
Answer.create(
  body: 'Земля и Нептун',
  question_id: question_id
)

# Quiz: Yes/No: questions/answers
question_id = Question.create(
  body: 'Быки реагируют на красный цвет?',
  answer_explanation: 'Быки практически не различают цветов. В корриде они реагируют
  не на красный, а на раздражающее размахивание плащом.'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Страусы от опасности прячут голову в песок?',
  answer_explanation: 'Страусы, когда чувствуют опасность, убегают. Миф о том, что
  они закапываются, возник, возможно, из-за того, что, обессилев от долгой погони,
  они просто роняют голову со своей длинной шеей.'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Бананы растут на пальмах?',
  answer_explanation: 'Банановое растение — это гигантская трава. А сами бананы —
  ягоды.'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Эйнштейн был двоечником?',
  answer_explanation: 'Эйнштейн учился не отлично, но хорошо. Единственная низкая
  оценка в его аттестате — тройка по французскому.'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Летучие мыши слепые?',
  answer_explanation: 'У летучих мышей вполне нормальное зрение. Они совмещают его
  возможности с эхолокацией.'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Молния не может ударить дважды в одно и то же место?',
  answer_explanation: 'Молния способна ударить в одно место не два и даже не три раза.
  В некоторые здания она бьет до ста раз в год.'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Площадь суши России больше, чем у Плутона?',
  answer_explanation: 'Площадь суши России — 17 млн км2. Это больше, чем у Плутона
  (16,6 млн  км2).'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  question_id: question_id
)
question_id = Question.create(
  body: 'Верблюды накапливают в горбах воду?',
  answer_explanation: 'Верблюды накапливают в горбах не воду, а жир.',
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Если взять в руку лягушку — появится бородавка?',
  answer_explanation: 'Бородавки могут появиться на руках от вируса папилломы человека.
  Но не лягушки.'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Нервные клетки не восстанавливаются?',
  answer_explanation: 'В мозге постоянно происходит процесс нейрогенеза — образования
  новых нервных клеток из клеток-предшественниц. С возрастом процесс замедляется.
  Но все же идет!'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Великая Китайская стена — единственный рукотворный объект на Земле, видимый
  из космоса?'.gsub("\n ", ''),
  answer_explanation: 'С низкой орбиты можно увидеть отнюдь не только Великую
  Китайскую стену. Египетские пирамиды, например, видно ничуть не хуже.'.gsub("\n ", ''),
  test_id: quiz_yes_no_id
).id
Answer.create(
  body: 'Да',
  question_id: question_id
)
Answer.create(
  body: 'Нет',
  correct: true,
  question_id: question_id
)

# Quiz: Animals: questions/answers
question_id = Question.create(
  body: 'Какая кошка самая большая на планете?',
  answer_explanation: 'Крупнейший подвид животного обитает в Сибири и достигает веса
  свыше 300 кг. При этом другие кошки тоже заслуживают особого внимания: рычание
  льва заставляет содрогаться всю саванну в окрестностях 5 километров, а гепард
  находится в Книге рекордов Гиннесса как самое быстрое млекопитающее.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'Лев',
  question_id: question_id
)
Answer.create(
  body: 'Тигр',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Гепард',
  question_id: question_id
)
Answer.create(
  body: 'Барс',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какое сухопутное животное может открыть рот максимально широко?',
  answer_explanation: 'У бегемота огромный рот, который открывается на 150 градусов
  и 1 м в высоту. Внутри челюстей расположены массивные зубы длиной около 45 см.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'Аллигатор',
  question_id: question_id
)
Answer.create(
  body: 'Крокодил',
  question_id: question_id
)
Answer.create(
  body: 'Бабуин',
  question_id: question_id
)
Answer.create(
  body: 'Бегемот',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Какое животное самое крупное на Земле?',
  answer_explanation: 'Африканский слон относится к крупнейшим наземным обитателям,
  но самым крупным животным на планете считается синий кит. Его вес может достигать
  200 тонн, что сопоставимо с массой 33 слонов.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'Африканский слон',
  question_id: question_id
)
Answer.create(
  body: 'Синий кит',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Кашалот',
  question_id: question_id
)
Answer.create(
  body: 'Гигантский кальмар',
  question_id: question_id
)
question_id = Question.create(
  body: 'Какое млекопитающее умеет летать?',
  answer_explanation: 'Белка-летяга и колуго (еще его называют «летающим лемуром»)
  только прыгают с одного дерева на другое, а белоголовый орлан относится к птицам,
  а не к млекопитающим. Поэтому единственный правильный ответ – летучая мышь.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'Летучая мышь',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Белка-летяга',
  question_id: question_id
)
Answer.create(
  body: 'Белоголовый орлан',
  question_id: question_id
)
Answer.create(
  body: 'Колуго',
  question_id: question_id
)
question_id = Question.create(
  body: 'Как называется животное, которое употребляет в пищу растения и мясо?',
  answer_explanation: 'Плотоядные особи употребляют мясо, травоядные – только
  растительную пищу, а всеядные – и те, и другие продукты. Под пескатарианством
  подразумевается поедание овощей и рыбы.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'Плотоядное животное',
  question_id: question_id
)
Answer.create(
  body: 'Травоядное животное',
  question_id: question_id
)
Answer.create(
  body: 'Всеядное животное',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Пескатариан',
  question_id: question_id
)
question_id = Question.create(
  body: 'Почему каланы («морские выдры») держатся за руки?',
  answer_explanation: 'Подобное явление относится к самым зрелищным и очаровательным
  в мире природы – животные держатся вместе в плавучих группах, которые называются
  «плотами», и часто связывают лапы, словно держатся за руки. Такой подход позволяет
  им поддерживать тесный телесный контакт и не уплывать далеко от семьи.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'Потому что они любят друг друга',
  question_id: question_id
)
Answer.create(
  body: 'Чтобы показать, что они в одной семье',
  question_id: question_id
)
Answer.create(
  body: 'Чтобы они не уплывали, когда спят',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Потому что они играют',
  question_id: question_id
)
question_id = Question.create(
  body: 'Как отличить насекомое от паука?',
  answer_explanation: 'Несмотря на массу сходств с другими ползучими насекомыми,
  пауки не являются насекомыми. Они принадлежат к классу паукообразных, которые
  сами употребляют в пищу насекомых.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'У насекомых три части тела, у пауков – две',
  question_id: question_id
)
Answer.create(
  body: 'У насекомых шесть ног, у пауков – восемь',
  question_id: question_id
)
Answer.create(
  body: 'У насекомых могут быть крылья, у пауков они отсутствуют',
  question_id: question_id
)
Answer.create(
  body: 'Все вышеперечисленные факты',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Чем утконос отличается от других млекопитающих?',
  answer_explanation: 'Утконос является одним из двух млекопитающих, которые
  откладывают яйца. Еще один вид – ехидна, или колючий муравьед, напоминающий
  дикобраза. Животные обитают в Австралии и практически не эволюционируют с
  доисторических времен. Утконос проводит яйцекладку в своей норе, а у ехидны
  для яиц есть сумка.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'Крякает, как утка',
  question_id: question_id
)
Answer.create(
  body: 'Откладывает яйца ',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Строит гнезда',
  question_id: question_id
)
Answer.create(
  body: 'Ковыляет',
  question_id: question_id
)
question_id = Question.create(
  body: 'Почему змеи высовывают язык?',
  answer_explanation: 'Змеи высовывают язык, чтобы получить химические данные из
  окружающей среды и передать их обратно к двум рецепторам на нёбе. Это объясняет,
  почему у змей раздвоенный язык.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'Чтобы напугать хищников',
  question_id: question_id
)
Answer.create(
  body: 'Чтобы облизать добычу',
  question_id: question_id
)
Answer.create(
  body: 'Чтобы издать шипящий звук',
  question_id: question_id
)
Answer.create(
  body: 'Чтобы «понюхать» воздух',
  correct: true,
  question_id: question_id
)
question_id = Question.create(
  body: 'Как называется явление, обозначающее, что на Земле не осталось ни одного
  животного конкретного вида?'.gsub("\n ", ''),
  answer_explanation: 'Самыми яркими представителями группы вымерших животных
  являются динозавры.'.gsub("\n ", ''),
  test_id: quiz_animals_id
).id
Answer.create(
  body: 'Эволюция',
  question_id: question_id
)
Answer.create(
  body: 'Сохранение',
  question_id: question_id
)
Answer.create(
  body: 'Вымирание',
  correct: true,
  question_id: question_id
)
Answer.create(
  body: 'Находящиеся под угрозой исчезновения',
  question_id: question_id
)

# Gererate randomized additional initial data
Category.all.count.times do |db_category_id|
  3.times do |i|
    rand(1..3).times do |j|
      test_level = j.zero? ? i + 1 : rand(1..3)
      Test.create(
        title: "Болванка [#{Category.find(db_category_id + 1).title}] уровень #{i + 1} номер #{j + 1}",
        level: test_level,
        category_id: db_category_id + 1
      )
    end
  end
end
db_tests = Test.where("title LIKE 'Болванка%'")
db_tests.each do |db_test|
  rand(5..15).times do
    question_id = Question.create(
      body: Faker::Markdown.emphasis,
      test_id: db_test.id
    ).id
    question_answer_count = rand(3..5)
    correct_answer = rand(1..question_answer_count)
    question_answer_count.times do |i|
      Answer.create(
        body: Faker::Book.title,
        correct: i + 1 == correct_answer,
        question_id: question_id
      )
    end
  end
end

rand(5..15).times { User.create(name: Faker::Name.name) }

def calculate_interrupt_question_id(db_questions, user_test_interrupt_chance)
  case rand(0..99) < user_test_interrupt_chance
  when true
    db_questions[rand(0..db_questions.length - 1)].id
  when false
    -1
  end
end

def add_test_ids_to_user_tests(db_user_tests, test_id)
  db_user_tests << '/' unless db_user_tests.empty?
  db_user_tests << "#{test_id}="
end

def add_answer_ids_to_user_tests(db_question, db_user_tests, user_question_success_chance)
  db_correct_answers = Answer.where(question_id: db_question.id).where(correct: true)
  db_wrong_answers = Answer.where(question_id: db_question.id).where(correct: false)
  case rand(0..99) < user_question_success_chance
  when true
    add_answers_to_to_user_tests(db_user_tests, db_correct_answers, 'correct')
  when false
    add_answers_to_to_user_tests(db_user_tests, db_wrong_answers, 'wrong')
  end
end

def add_question_ids_to_to_user_tests(db_question, db_user_tests)
  db_user_tests << '+' unless db_user_tests.end_with?('=')
  db_user_tests << "#{db_question.id}:"
end

def add_answers_to_to_user_tests(db_user_tests, db_answers, answers_type)
  case answers_type == 'correct'
  when true
    db_answers.each do |answer|
      db_user_tests << ',' unless db_user_tests.end_with?('+', '=', ':')
      db_user_tests << answer.id.to_s
    end
  when false
    db_user_tests << db_answers[rand(0..db_answers.length - 1)].id.to_s
  end
end

zero_activity_user_chance = rand(20..50)
User.all.each do |user|
  next if rand(0..99) < zero_activity_user_chance

  user_test_start_chance = rand(30..70)
  user_test_interrupt_chance = rand(3..10)
  user_question_success_chance = rand(30..100)
  db_user_tests = ''
  Test.count.times do |i|
    next unless rand(0..99) < user_test_start_chance

    add_test_ids_to_user_tests(db_user_tests, i + 1)
    db_questions = Question.where(test_id: i + 1)
    interrupt_question_id = calculate_interrupt_question_id(db_questions, user_test_interrupt_chance)
    db_questions.each do |db_question|
      add_question_ids_to_to_user_tests(db_question, db_user_tests)
      add_answer_ids_to_user_tests(db_question, db_user_tests, user_question_success_chance)
      break if db_question.id == interrupt_question_id
    end
  end
  user.update(tests: db_user_tests)
end

def show_users
  puts "All users stats:"
  User.all.each do |user|
    puts "#{'=' * 10}\nid: #{user.id}\nname: #{user.name}"
    user.tests.nil? ? (puts '-no started tests-') : (puts "tests: #{user.tests}")
    puts "created_at: #{user.created_at}\nupdated_at: #{user.updated_at}"
  end
end

# show_users
