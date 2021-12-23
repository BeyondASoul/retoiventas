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

List<ChatMessage> messages = [
  ChatMessage(
    messageContent: "Hola, buen día",
    messageType: "n8I4mNsEAEPstH3aTHdbORaS4xJ3",
    date: DateTime.now(),
  ),
  ChatMessage(
    messageContent: "Necesito información",
    messageType: "n8I4mNsEAEPstH3aTHdbORaS4xJ3",
    date: DateTime.now(),
  ),
  ChatMessage(
    messageContent: "Muchas gracias, soy Alejandro",
    messageType: "Q9glEz1xPJUSRVwcQCjWSZiR1lm2",
    date: DateTime.now(),
  ),
  ChatMessage(
    messageContent: "¡Claro! dime por favor, ¿Cuál es tu nombre?",
    messageType: "Q9glEz1xPJUSRVwcQCjWSZiR1lm2",
    date: DateTime.now(),
  ),
  ChatMessage(
    messageContent: "Soy Lucía, tengo 38 años",
    messageType: "n8I4mNsEAEPstH3aTHdbORaS4xJ3",
    date: DateTime.now(),
  ),
  ChatMessage(
    messageContent:
        "¿Qué necesito para contratar su servicio? Me urge cambiarme de proveedor, ya tengo todos mis papeles listos...",
    messageType: "n8I4mNsEAEPstH3aTHdbORaS4xJ3",
    date: DateTime.now(),
  ),
  ChatMessage(
    messageContent:
        "Muchas gracias! ¿Cuál es tu correo electrónico para poder enviarte toda la información?",
    messageType: "Q9glEz1xPJUSRVwcQCjWSZiR1lm2",
    date: DateTime.now(),
  ),
  ChatMessage(
    messageContent: "De acuerdo. 😁 \nMi correo es lucia-test@gmail.com",
    messageType: "n8I4mNsEAEPstH3aTHdbORaS4xJ3",
    date: DateTime.now(),
  ),
];
