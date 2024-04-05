import 'package:rxdart/subjects.dart';

class GSPageTwoBloc {
  final indexSubject = BehaviorSubject<int?>();
  Stream<int?> get getIndex => indexSubject.stream;
  Function(int?) get setIndex => indexSubject.add;

  void dispose() {
    indexSubject.close();
  }
}
