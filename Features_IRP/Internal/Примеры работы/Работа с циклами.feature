﻿#language: ru

@tree

Функционал: Пример работы с циклами

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Сценарий: Пример работы с циклами
*Изменение всех строк ТЧ
	И для каждой строки таблицы "ItemList" я выполняю используя колонку "N"
		И в таблице "ItemList" в поле "Количество" я ввожу текст "50,000"
*Удаление строк в таблице
	И пока в таблице "ItemList" количество строк ">" 0 Тогда
		И в таблице "ItemList" я удаляю строку
*Циклы и условия
	И для каждой строки таблицы "ItemList" я выполняю используя колонку "N" //И для каждой строки таблицы "ItemList" я выполняю  - не работает зацикливается
		Если таблица "ItemList" содержит строки Тогда:
			| 'Номенклатура'            | 'Вид цены'          |
			| 'Товар без характеристик' | 'Ручное назначение' |
			И в таблице "ItemList" я перехожу к строке
				| 'Номенклатура'            | 'Вид цены'          |
				| 'Товар без характеристик' | 'Ручное назначение' |
			И в таблице "ItemList" я выбираю текущую строку
			И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListPriceType"
			Тогда открылось окно 'Виды цен'
			И в таблице "List" я перехожу к строке:
				| 'Валюта' | 'Код' | 'Наименование'      | 'Ссылка'            |
				| 'USD'    | '3'   | 'Цена поставщика 1' | 'Цена поставщика 1' |
			И в таблице "List" я выбираю текущую строку
			И В таблице "ItemList" я завершаю редактирование строки
	И таблица  "ItemList" не содержит строки:
		| 'Номенклатура'            | 'Вид цены'          |
		| 'Товар без характеристик' | 'Ручное назначение' |

Сценарий: перебор элементов справочника Номенклатура	
	И для каждой строки таблицы "List" я выполняю //переход начинается с первой строки
		И в таблице "List" я выбираю текущую строку
		Тогда не появилось окно предупреждения системы
		И я закрываю текущее окно
		
Сценарий: пример нагрузчоного тестирования (создание элементов справочника)
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '"ед. изм. "+$Шаг$' в переменную "НаименованиеЕдиницы"
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		//далее используем обработку подготовки данных для загрузки для формирования шаблона шага, в выражении генерируем новую ссылку
		И я проверяю или создаю для справочника "Units" объекты:
			| 'Ref'                                                                                   | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en'        | 'Description_hash' | 'Description_ru'        | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{"e1cib/data/Catalog.Units?ref=" + СтрЗаменить(Новый УникальныйИдентификатор,"-","")}' | 'False'        |        | ''     | 1          | ''          | ''    | '$НаименованиеЕдиницы$' | ''                 | '$НаименованиеЕдиницы$' | ''               |          |          |          |          |         |

						