class ChatScreenDataModal {
  final String messageORTime;
  final bool? sendByMe;
  final bool isTime;

  ChatScreenDataModal({
    required this.messageORTime,
    this.sendByMe,
    required this.isTime,
  });
}

List<ChatScreenDataModal> messagesDataList = [
  ChatScreenDataModal(
    messageORTime: '1 April 12:00',
    isTime: true,
  ),
  ChatScreenDataModal(
    messageORTime:
        'Hey, Alex! Nice to meet you!\nI’d like to hire a walker and you’re perfect one for me.\nCan you help me out?',
    sendByMe: true,
    isTime: false,
  ),
  ChatScreenDataModal(
    messageORTime: 'Hi! That’s great! Let me give you a call and we’ll discuss all the details',
    sendByMe: false,
    isTime: false,
  ),
  ChatScreenDataModal(
    messageORTime: '12:30',
    isTime: true,
  ),
  ChatScreenDataModal(
    messageORTime: 'Okay, I’m waiting for a call)',
    sendByMe: true,
    isTime: false,
  ),
];
