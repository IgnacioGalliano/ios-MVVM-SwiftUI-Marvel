<h1 align="center" style="border-bottom: none">
    <img alt="Marvel SwiftUI App" src="https://github.com/IgnacioGalliano/MarvelMockAPI/blob/main/Assets/Marvel-Studios-Logo-2008.png?raw=true"><br>Marvel SwiftUI App
</h1>


## How to run this application?

Easier way:

1) Run <a href="https://github.com/IgnacioGalliano/MarvelMockAPI">the mock server</a>
2) Select the local scheme
 <img alt="local scheme" src="https://github.com/IgnacioGalliano/ios-MVVM-SwiftUI-Marvel/blob/main/Readme%20Assets/LocalScheme.png?raw=true">
3. Run the application


Other way:

1) Create a new account on the <a href="https://developer.marvel.com/account"> Marvel website </a>
2) Create a new MarvelMovieDB-info.plist file
3) Add your keys "PRIVATE_KEY" / "PUBLIC_KEY"
4) Run the application with the common scheme
<img alt="local scheme" src="https://github.com/IgnacioGalliano/ios-MVVM-SwiftUI-Marvel/blob/main/Readme%20Assets/ProdScheme.png?raw=true">

<div align="center">
<img alt="local scheme" src="https://github.com/IgnacioGalliano/ios-MVVM-SwiftUI-Marvel/blob/main/Readme%20Assets/App.gif?raw=true"></div>

### <b>UnitTests & UITests</b>
To run the tests targets, you need to use an iphone 15 simulator with iOS 17.0. Why? because the snapshot tests refenrences had been done on this device and iOS version.
Also you need to run <a href="https://github.com/IgnacioGalliano/MarvelMockAPI">the mock server</a> and use the local scheme to assert all the UITests


### <b>Clean Architecture and MVVM</b>

In this example we applied clean code with the three layers 

<ins>Presentation layer (MVVM)</ins>: contains UI (UIViewControllers or SwiftUI Views). Views are coordinated by ViewModels (Presenters) which execute one or many Use Cases. Presentation Layer depends only on the Domain Layer.

<ins>Domain layer</ins>: It contains Entities, UseCases, Errors, etc.

<ins>Data layer</ins>: Data Layer contains Repository Implementations and one or many Data Sources. Repositories are responsible for coordinating data from different Data Sources. Data Source can be Remote or Local (for example persistent database). Data Layer depends only on the Domain Layer. In this layer, we can also add mapping of Network JSON Data.




