import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class GetStartedBloc {
  final BuildContext context;

  GetStartedBloc({required this.context});

  PageController pageController = PageController();

  final pageNumberSubject = BehaviorSubject<int>.seeded(1);
  Stream<int> get getPageNumber => pageNumberSubject.stream;
  Function(int) get setPageNumber => pageNumberSubject.add;

  void dispose() {
    pageNumberSubject.close();
  }
}
