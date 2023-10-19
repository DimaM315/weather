# Малышев Дмитрий


## Тестовое задание Mobile (Flutter)


На основной странице приложения (FavCitiesScreen) выводится краткая информация о погоде в нескольких, выбранных мной, городах. На данном экране отображается список из иконок погод и названия городов. При клике на элемент списка отображается экран (CityScreen) с более подробной информацией о погоде, того города на который кликнули. Так же справа внизу, на главном экране, отображается иконка, кликнув по которой пользователя перекидывает на экран (CurrentUserWeatherScreen). 

Экран (CurrentUserWeatherScreen), на нём происходит определение локации уст-ва, если пользователь отконил запрос о получении локации, выдаст соответствующее сообщение. Если всё прошло успешно, пользователю отобразится экран (CityWeatherWidget) с подробной информацией о погоде полученной по его местоположению.

Информация о погоде, информация загружается из API OpenWeatherMap (One Call API 1.0)
