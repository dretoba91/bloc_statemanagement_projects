# bloc_state_management_projects

Flutter project on using BLOC to manage state.

## Getting Started

Fork the repository to your local, and within the main.dart file, you can switch betweeen projects.

## List of Projects
- Infinite List
- Todo
- Weather app
- Firebase login


## Infinite List

### Required dependencies

    dependencies:
    bloc: ^8.1.0
    bloc_concurrency: ^0.2.0
    cupertino_icons: ^1.0.6
    equatable: ^2.0.3
    flutter:
        sdk: flutter
    flutter_bloc: ^8.1.1
    google_fonts: ^6.2.1
    http: ^1.0.0
    stream_transform: ^2.0.0

    dev_dependencies:
    build_runner: ^2.4.10

    The Bloc from Bloc state management package was used to manage the infinite list application state. Three files, bloc_state, bloc_event, and bloc, were generated inside the bloc folder. 
    The PostEvent abstract class, which other event classes extend, is contained in the bloc_event files. Thus, the abstract class PostEvent is extended by the PostFetchedEvent. Every event that takes place within the program is managed by this class.
    Inside the bloc_state file, there are the enum PostState variables, and the file also contains the abstract PostState class. This PostState class has 3 variables: PostStatus status, List<Post> posts, and bool hasReachedMax, along with the class constructor and data generated.
    The bloc file is where the PostBloc class extends the Bloc<PostEvent, PostState> from the flutter_bloc packages. The PostBloc class takes both the PostEvent and PostState as its class type, and it is where the on<> method handles the management of the state. An event will trigger a state, and the state will be emitted in order to cause a change in the state.
    The PostFetched event will cause a trigger, and the PostBloc class will emit the PostState to cause a change in the state of the application.




## Todo
### Required dependencies

    dependencies:
    bloc: ^8.1.0    
    flutter:
        sdk: flutter
    flutter_bloc: ^8.1.1
    google_fonts: ^6.2.1    

    dev_dependencies:
    build_runner: ^2.4.10


## Weather App


## Firebase Login
