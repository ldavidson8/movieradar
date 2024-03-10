import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavigationEvent {
  homeTapped,
  searchTapped,
  favouritesTapped,
  settingsTapped,
}

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, int> {
  BottomNavigationBloc() : super(0) {
    on<BottomNavigationEvent>((event, emit) {
      switch (event) {
        case BottomNavigationEvent.homeTapped:
          emit(0);
          break;
        case BottomNavigationEvent.searchTapped:
          emit(1);
          break;
        case BottomNavigationEvent.favouritesTapped:
          emit(2);
          break;
        case BottomNavigationEvent.settingsTapped:
          emit(3);
          break;
        default:
          emit(0);
          break;
      }
    });
  }
}
