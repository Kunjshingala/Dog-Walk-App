import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class NavigationBloc {
  final BuildContext context;

  NavigationBloc({required this.context});

  final navigationPageSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getNavigationPage => navigationPageSubject.stream;
  Function(int) get setNavigationPage => navigationPageSubject.add;

  void dispose() {
    navigationPageSubject.close();
  }
}
