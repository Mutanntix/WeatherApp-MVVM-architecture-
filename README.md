# Weather app (MVVM)

---


###### _Weather app is a little application that allows you to find out the current weather forecast. This app was created with MVVM architecture._
###### Weather app - это небольшое приложение, которое позволяет узнать текущий прогноз погоды. Приложение создано на основе архитектурного паттерна MVVM._

---

### What technologies were used? Какие технологии были использованы?
###### Creating this application, I used the following technologies: 
###### При создании этого приложения я использовал следующие технологии:

- Swift 5
- XCODE 13
- UIKit (without storyboard)
- MVVM
- SnapKit
- UserDefaults
- Frames
- JSON, JSONSerialization, JSONDecoder, JSONEncoder etc 
- Callbacks
- URLComponents
- Foundation



---

#### There is only one screen in this application, which consists of several subviews, one button (it is just needed to work with a closure that responds to changes in the ViewModel, and a SearchController is built into the NavigationBar, which gives the user the opportunity to find a location and find out the weather for it. The application has a small network layer for working with the network, whose methods are called on a timer (after calling updateSearchResults) and return the decoded weather data model.
#### В этом приложении всего один экран, который состоит из нескольких subview, одной кнопки (она нужна просто для работы с замыканием, которое реагирует на изменения во viewModel (модель представления), а в navigationBar встроен searchController, который дает пользователю возможность найти локацию и узнать погоду для нее. В приложении есть небольшой нетворк слой для работы с сетью, методы которого вызываются по таймеру (после вызова updateSearchResults) и возращают декодированную модель данных о погоде.

![Something went wrong...](/DEMO/first.png)
![Something went wrong...](/DEMO/second.png)
![Something went wrong...](/DEMO/third.png)
![Something went wrong...](/DEMO/fourth.png)

---

### Thanks for watching! Have a good day! 👋
### Спасибо за просмотр! Хорошего дня! 👋
