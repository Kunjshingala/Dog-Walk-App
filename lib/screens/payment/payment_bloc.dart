import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class PaymentBloc {
  final BuildContext context;

  PaymentBloc({required this.context});

  final int totalAmount = 326035;

  final pageController = PageController(initialPage: 0);

  final pageIndexSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get getPageIndex => pageIndexSubject.stream;
  Function(int) get setPageIndex => pageIndexSubject.add;

  final List<PaymentHistorySpendModal> paymentHistoryList = [
    PaymentHistorySpendModal(category: '🍎', detail: 'Groceries', amount: 12, isIn: false),
    PaymentHistorySpendModal(category: '🎮', detail: 'Gaming Console', amount: 12, isIn: true),
    PaymentHistorySpendModal(category: '👨🏽‍', detail: 'Sameer', amount: 12, isIn: true),
    PaymentHistorySpendModal(category: '🍎', detail: 'Groceries', amount: 12, isIn: false),
    PaymentHistorySpendModal(category: '🎮', detail: 'Gaming Console', amount: 12, isIn: true),
    PaymentHistorySpendModal(category: '👨🏽‍', detail: 'Sameer', amount: 12, isIn: true),
  ];

  final List<CardModal> cardList = [
    CardModal(
      cardHolderName: 'Cristian Downey',
      amount: '3,265,23',
      cardNumber: '5282 3456 7890 1289',
      expirationDate: '09/25',
      cardCompanyLogo: 'assets/icons/master_card_icon.svg',
    ),
    CardModal(
      cardHolderName: 'Robert Downey',
      amount: '55,265,23',
      cardNumber: '5282 3456 7890 1290',
      expirationDate: '05/24',
      cardCompanyLogo: 'assets/icons/master_card_icon.svg',
    ),
  ];

  void dispose() {
    pageController.dispose();
    pageIndexSubject.close();
  }
}

class CardModal {
  final String cardHolderName;
  final String amount;
  final String cardNumber;
  final String expirationDate;
  final String cardCompanyLogo;

  CardModal({
    required this.cardHolderName,
    required this.amount,
    required this.cardNumber,
    required this.expirationDate,
    required this.cardCompanyLogo,
  });
}

class PaymentHistorySpendModal {
  final String category;
  final String detail;
  final int amount;
  final bool isIn;

  PaymentHistorySpendModal({
    required this.category,
    required this.detail,
    required this.amount,
    required this.isIn,
  });
}
