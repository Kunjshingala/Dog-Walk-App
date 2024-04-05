class ChatListScreenDataModal {
  final String profilePic;
  final String name;
  final String lastMessage;
  final bool isSeen;

  ChatListScreenDataModal({
    required this.profilePic,
    required this.name,
    required this.lastMessage,
    required this.isSeen,
  });
}

List<ChatListScreenDataModal> chatListScreenDataList = [
  ChatListScreenDataModal(
    profilePic: 'assets/images/home/chat/chat1.jpeg',
    name: 'Will Knowles',
    lastMessage: 'Hey! How’s your dog? ∙ 1min',
    isSeen: false,
  ),
  ChatListScreenDataModal(
    profilePic: 'assets/images/home/chat/chat2.jpeg',
    name: 'Ryan Bond',
    lastMessage: 'Let’s go out! ∙ 5h',
    isSeen: true,
  ),
  ChatListScreenDataModal(
    profilePic: 'assets/images/home/chat/chat3.jpeg',
    name: 'Sirena Paul',
    lastMessage: 'Hey! Long time no see ∙ 1min',
    isSeen: false,
  ),
  ChatListScreenDataModal(
    profilePic: 'assets/images/home/chat/chat4.jpeg',
    name: 'Matt Chapman',
    lastMessage: 'You fed the dog? ∙ 6h',
    isSeen: true,
  ),
  ChatListScreenDataModal(
    profilePic: 'assets/images/home/chat/chat5.jpeg',
    name: 'Laura Pierce',
    lastMessage: 'How are you doing? ∙ 7h',
    isSeen: true,
  ),
  ChatListScreenDataModal(
    profilePic: 'assets/images/home/chat/chat6.jpeg',
    name: 'Alex Murray',
    lastMessage: 'Okay, I’m waiting for a call)',
    isSeen: true,
  ),
];
