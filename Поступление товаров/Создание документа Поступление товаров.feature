#language: ru 

@tree

Функционал: Создание документа Поступление товаров

Как Менеджер по закупкам я хочу
Создание документа Поступление товаров 
чтобы поставить товар на учет

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание документа Поступление товаров
//Создание документа
*Открытие формы создание документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
*Заполнение шапки документа	
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Средний'
	Тогда элемент формы с именем "Склад" стал равен 'Средний'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000012' | 'Мосхлеб ОАО'  |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
*Заполнение ТЧ Товары	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке "Bosch1234"
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '15,00'
	И в таблице "Товары" я завершаю редактирование строки
*Проверка заполнения ТЧ Товары
	Тогда таблица "Товары" содержит строки:
		| 'N' | 'Товар'     | 'Артикул' | 'Цена'     | 'Количество' | 'Сумма'     |
		| '1' | 'Bosch1234' | '*'  | '2 500,00' | '15,00'      | '37 500,00' |

И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$НомерДокумента$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер'     |
		| '$НомерДокумента$' |
	
Сценарий: проверка наличия в справочнике Номенклатура, элемента с наименованием "Торт"
И В командном интерфейсе я выбираю 'Продажи' 'Товары'
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
И таблица "Список" содержит строки:
	| 'Наименование'     |
	| 'Торт' |
