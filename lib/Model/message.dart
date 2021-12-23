class ChatMessage {
  final String messageContent;
  final String messageType;
  final DateTime date;
  const ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.date});

  ChatMessage fromJson(Map<String, dynamic> json) => ChatMessage(
        messageContent: json['messageContent'],
        messageType: json['messageType'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'messageContent': messageContent,
        'messageType': messageType,
        'date': date,
      };
}
