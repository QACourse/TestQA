#language: ru

@tree
@ДвижениеДокументов

Функционал: проверка движений Поступления товаров

Как Тестировщик я хочу
проверить движения товаров документа Поступление товаров
чтобы документ делал нужные движения по регистрам

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: 0501 подготовительный сценарий

	Когда  экспорт документов закупок
	Когда  загрузка документа Поступление товаров
	//Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	//И в таблице 'List' я выделяю все строки
	//И в таблице "List" я нажимаю на кнопку с именем 'ListContextMenuPost'
	//Тогда не появилось окно предупреждения системы
	И я выполняю код встроенного языка на сервере
	|'Документы.PurchaseInvoice.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: 0502 проверка движений Поступления товаров по регистру R1001 Закупки

И я закрываю все окна клиентского приложения
Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
И в таблице "List" я перехожу к строке по шаблону:
	| 'Номер' | 'Партнер'     | 'Организация'            | 'Дата' | 'Контрагент'  | 'Сумма'  |
	| '3'     | 'Поставщик 2' | 'Собственная компания 1' | '*'    | 'Поставщик 2' | '400,00' |
И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1001 Закупки'
И я нажимаю на кнопку с именем 'GenerateReport'
Тогда табличный документ "ResultTable" равен по шаблону:
	| 'Поступление товаров и услуг 3 от *' | ''       | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                   | ''                        | ''                                     | ''                  |
	| 'Движения документа по регистрам'    | ''       | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                   | ''                        | ''                                     | ''                  |
	| 'Регистр  "R1001 Закупки"'           | ''       | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                   | ''                        | ''                                     | ''                  |
	| ''                                   | 'Period' | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                   | ''                        | ''                                     | 'Attributes'        |
	| ''                                   | ''       | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                             | 'Характеристика'          | 'Ключ строки'                          | 'Отложенный расчет' |
	| ''                                   | '*'      | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 3 от *' | 'Услуга'                  | '88fa3165-7885-4ca6-9028-c3d85dd4aebb' | 'Да'                |
	| ''                                   | '*'      | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 3 от *' | 'Услуга'                  | '88fa3165-7885-4ca6-9028-c3d85dd4aebb' | 'Нет'               |
	| ''                                   | '*'      | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 3 от *' | 'Услуга'                  | '88fa3165-7885-4ca6-9028-c3d85dd4aebb' | 'Нет'               |
	| ''                                   | '*'      | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 3 от *' | 'Услуга'                  | '88fa3165-7885-4ca6-9028-c3d85dd4aebb' | 'Нет'               |
	| ''                                   | '*'      | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 3 от *' | 'Услуга'                  | '88fa3165-7885-4ca6-9028-c3d85dd4aebb' | 'Нет'               |
	| ''                                   | '*'      | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 3 от *' | 'Товар без характеристик' | '4ab09bb8-1ea8-4b1f-be65-e3a7f7e4ca92' | 'Да'                |
	| ''                                   | '*'      | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 3 от *' | 'Товар без характеристик' | '4ab09bb8-1ea8-4b1f-be65-e3a7f7e4ca92' | 'Нет'               |
	| ''                                   | '*'      | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 3 от *' | 'Товар без характеристик' | '4ab09bb8-1ea8-4b1f-be65-e3a7f7e4ca92' | 'Нет'               |
	| ''                                   | '*'      | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 3 от *' | 'Товар без характеристик' | '4ab09bb8-1ea8-4b1f-be65-e3a7f7e4ca92' | 'Нет'               |
	| ''                                   | '*'      | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 3 от *' | 'Товар без характеристик' | '4ab09bb8-1ea8-4b1f-be65-e3a7f7e4ca92' | 'Нет'               |
И табличный документ "ResultTable" содержит строки из макета "МакетДвиженийЗакупки" по шаблону
И я закрываю все окна клиентского приложения

