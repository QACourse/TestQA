﻿#language: ru

@tree

Функционал: проверка заполнения поля Организация

Как Тестировщик я хочу
проверить заполнение поля Соглашения
чтобы проверить логику работы формы

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка заполнения поля Организацияпри выборе Соглашения
*Закрытие всех окон
	И я закрываю все окна клиентского приложения
*Создание документа Заказ клиента
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'       |
		| '12'  | 'Розничный клиент 1' |
	И в таблице "List" я выбираю текущую строку
*Выбор соглашения	
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'       | 'Вид'     | 'Вид взаиморасчетов' |
		| '9'   | 'Розничный клиент 1' | 'Обычное' | 'По соглашениям'     |
	И в таблице "List" я выбираю текущую строку
*Проверка заполнения соглашения
	Если поле с именем "Company" заполнено Тогда
	иначе
		И я нажимаю кнопку выбора у поля с именем "Company"
		Тогда открылось окно 'Организации'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'           |
			| '2'   | 'Собственная компания 2' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Company" стал равен 'Собственная компания 2'
	//Простой вариант
		//Если элемент формы "Организация" стал равен '' Тогда					
	