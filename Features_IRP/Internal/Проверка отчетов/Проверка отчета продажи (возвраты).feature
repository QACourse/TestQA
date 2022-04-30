#language: ru

@tree
@Отчеты

Функционал: Тестирование отчетов продаж (возвраты)

Как Тестировщик я хочу
протестировать отчет о продажах
чтобы у пользователей не было проблем в работе с отчетами продаж

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: дз040201 подготовка данных для тестирования отчетов
	Когда экспорт основных данных
	Когда экспорт документов продаж
	И я выполняю код встроенного языка на сервере
	|'Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.SalesOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
	|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: дз040202 Проверка отчета о продажах (возвраты)
*Закрытие всех окон
	И я закрываю все окна клиентского приложения
*Открытие отчета
	Дано Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
	Тогда открылось окно 'D2001 Продажи'
*Изменение настроек отчета	
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И в таблице "SettingsComposerSettings" я перехожу к строке:
		| 'Использование' | 'Структура отчета'   |
		| 'Нет'           | '<Детальные записи>' |
	И в таблице "SettingsComposerSettings" я изменяю флаг с именем 'SettingsComposerSettingsUse'
	И в таблице "SettingsComposerSettings" я завершаю редактирование строки
	И я перехожу к закладке с именем "FilterPage"
	И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я перехожу к строке:
		| 'Доступные поля' |
		| 'Количество'     |
	И в таблице "SettingsComposerSettingsFilterFilterAvailableFields" я нажимаю на кнопку с именем 'SettingsComposerSettingsFilterFilterAvailableFieldsChoose'
	И в таблице "SettingsComposerSettingsFilter" я активизирую поле с именем "SettingsComposerSettingsFilterComparisonType"
	И в таблице "SettingsComposerSettingsFilter" я выбираю текущую строку
	И в таблице "SettingsComposerSettingsFilter" из выпадающего списка с именем "SettingsComposerSettingsFilterComparisonType" я выбираю точное значение 'Меньше'
	И в таблице "SettingsComposerSettingsFilter" я активизирую поле с именем "SettingsComposerSettingsFilterRightValue"
	И в таблице "SettingsComposerSettingsFilter" в поле с именем 'SettingsComposerSettingsFilterRightValue' я ввожу текст '0,000'
	И в таблице "SettingsComposerSettingsFilter" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'
	И я нажимаю на кнопку с именем 'FormGenerate' 
*Проверка соответствия результата отчета макету	
	Дано Табличный документ "Result" равен макету "ПродажиВозвратыОтчет"
*Закрытие окон
	И я закрываю все окна клиентского приложения
		
