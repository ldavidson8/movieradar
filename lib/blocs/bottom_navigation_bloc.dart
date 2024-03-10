import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavigationEvent {
  homeTapped,
  searchTapped,
  favouritesTapped,
  settingsTapped,
}

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, int> {
  BottomNavigationBloc() : super(0);

  Stream<int> mapEventToState(BottomNavigationEvent event) async* {
    switch (event) {
      case BottomNavigationEvent.homeTapped:
        yield 0;
        break;
      case BottomNavigationEvent.searchTapped:
        yield 1;
        break;
      case BottomNavigationEvent.favouritesTapped:
        yield 2;
        break;
      case BottomNavigationEvent.settingsTapped:
        yield 3;
        break;
    }
  }
}
