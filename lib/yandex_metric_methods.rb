module Yandex
Metric.api_method 'Список счетчиков','/counters','GET POST','-'
Metric.api_method 'Счетчик','/counter/{id}','GET PUT DELETE','id  ― числовой идентификатор счетчика.'
Metric.api_method 'Список целей счетчика','/counter/{id}/goals','GET POST','-'
Metric.api_method 'Цель счетчика','/counter/{id}/goal/{goal_id}','GET PUT DELETE','goal_id  ― числовой идентификатор цели.'
Metric.api_method 'Список фильтров счетчика','/counter/{id}/filters','GET POST','filter_id  ― числовой идентификатор фильтра.'
Metric.api_method 'Фильтр счетчика','/counter/{id}/filter/{filter_id}','GET PUT DELETE','filter_id  ― числовой идентификатор фильтра.'
Metric.api_method 'Список операций счетчика','/counter/{id}/operations','GET POST','-'
Metric.api_method 'Операция счетчика','/counter/{id}/operation/{operation_id}','GET PUT DELETE','operation_id  ― числовой идентификатор операции.'
Metric.api_method 'Список гостевых доступов счетчика','/counter/{id}/grants','GET POST','-'
Metric.api_method 'Право доступа к счетчику','/counter/{id}/grant/{user_login}','GET PUT DELETE','user_login  ― логин пользователя, которому выдан гостевой доступ. Для публичной статистики вместо логина пользователя указывается «0».'
Metric.api_method 'Список собственных представителей','/delegates','GET PUT POST','-'
Metric.api_method 'Представитель','/delegate/{user_login}','DELETE','user_login  ― логин пользователя, которому выдан полный доступ.'
Metric.api_method 'Список аккаунтов (прав на представительство)','/accounts','GET PUT','-'
Metric.api_method 'Аккаунт','/account/{user_login}','DELETE','user_login  ― логин владельца аккаунта.'
Metric.api_method 'Посещаемость','stat/traffic/summary','GET'
Metric.api_method 'Вовлечение','stat/traffic/deepness','GET'
Metric.api_method 'По времени суток','stat/traffic/hourly','GET'
Metric.api_method 'Нагрузка на сайт','stat/traffic/load','GET'
Metric.api_method 'Сводка','stat/sources/summary','GET'
Metric.api_method 'Сайты','stat/sources/sites','GET'
Metric.api_method 'Поисковые системы','stat/sources/search_engines','GET'
Metric.api_method 'Поисковые фразы','stat/sources/phrases','GET'
Metric.api_method 'Рекламные системы','stat/sources/marketing','GET'
Metric.api_method 'Директ ― сводка','stat/sources/direct/summary','GET'
Metric.api_method 'Директ ― площадки','stat/sources/direct/platforms','GET'
Metric.api_method 'Директ ― регионы','stat/sources/direct/regions','GET'
Metric.api_method 'Метки','stat/sources/tags','GET'
Metric.api_method 'Популярное содержание','stat/content/popular','GET'
Metric.api_method 'Страницы входа','stat/content/entrance','GET'
Metric.api_method 'Страницы выхода','stat/content/exit','GET'
Metric.api_method 'Заголовки страниц','stat/content/titles','GET'
Metric.api_method 'Параметры URL','stat/content/url_param','GET'
Metric.api_method 'Отчет по Странам мира','stat/geo','GET'
Metric.api_method 'Пол и возраст','stat/demography/age_gender','GET'
Metric.api_method 'Половозрастная структура','stat/demography/structure','GET'
Metric.api_method 'Браузеры','stat/tech/browsers','GET'
Metric.api_method 'Операционные системы','stat/tech/os','GET'
Metric.api_method 'Разрешения дисплеев','stat/tech/display','GET'
Metric.api_method 'Мобильные устройства','stat/tech/mobile','GET'
Metric.api_method 'Версии Flash','stat/tech/flash','GET'
Metric.api_method 'Версии Silverlight','stat/tech/silverlight','GET'
Metric.api_method 'Версии .NET','stat/tech/dotnet','GET'
Metric.api_method 'Наличие Java','stat/tech/java','GET'
Metric.api_method 'Наличие Cookies','stat/tech/cookies','GET'
end
