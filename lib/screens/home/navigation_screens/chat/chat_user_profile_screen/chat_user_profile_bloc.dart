import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ChatUserProfileBloc {
  final BuildContext context;

  ChatUserProfileBloc({required this.context});

  final tabIndexSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getTabIndex => tabIndexSubject.stream;
  Function(int) get setTabIndex => tabIndexSubject.add;

  void dispose() {
    tabIndexSubject.close();
  }
}
