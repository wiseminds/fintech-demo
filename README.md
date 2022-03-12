# example
<p align="center">
  <img src="https://github.com/wiseminds/fintech-demo/raw/main/screenshots/all-transactions.png" alt="Screenshot" height="700" />
  <img src="https://github.com/wiseminds/fintech-demo/raw/main/screenshots/transaction-details.png" alt="Screenshot" height="700" />
</p> 



### Platforms
runs ons android, iOS, windows, macOS, and web
### Dark mode
to try dark mode, change your device mode to dark mode

#### 

### Run Tests (run `flutter test`)
A widget test that runs app from splash screen and taps to transaction page


I am a lover of [SOLID] and [Clean] architectures of programming, to demonstrate a bit of this, I used [get_it] for dependency injection. This helps me instantiate different env depending on the runtime and use a different [ApiProvider] for test.

Flutter is an interesting framework to work with, but requires a solid folder structure to build a scalable application. Based on research and years of experience, I have come to adopt a folder structure I use in most of my projects.
This project uses [BuiltValue] and BuiltSerializer for json serialization.
the models are auto generated using Built generator.
to generate models, run 
##### flutter packages pub run build_runner build --delete-conflicting-outputs



 
### lib
under the lib directory, below is the project structure
constants
this is a folder that holds static constants like strings and dimension used in the app.

#### views
this holds all screens contained in the app.
### widgets
this holds all reusable widgets used in the app.

### models
this holds all data models used in the app.

# data
this is also known as the data layer, it handles all access to data including cache and remote data. it makes decision based on parameters passed in to either fetch from cache or fetch from a remote source.
this library is a custom http library I built to handle a lot of the boilerplate involved in data access including features like parsing JSON into specified dart model, uploading a file.
you can use any http library available (http, dio, chopper, e.t.c) to handle actual http call, just make sure to implement [ApiProvider] and implement all methods.

#### core 
this holds some core utility classes like app theme, extension methods.