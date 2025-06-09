import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessagingScreen extends StatefulWidget {
  final String userId;
  final String otherUserId;
  MessagingScreen({required this.userId, required this.otherUserId});

  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  late IO.Socket socket;
  List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Replace with your backend Socket.IO URL
    socket = IO.io('https://your-backend-url.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.onConnect((_) {
      socket.emit('join_room', widget.userId);
      // Optionally fetch initial messages here
    });
    socket.on('receive_message', (msg) {
      setState(() {
        messages.add(Map<String, dynamic>.from(msg));
      });
    });
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }

  void sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    socket.emit('send_message', {
      'senderId': widget.userId,
      'receiverId': widget.otherUserId,
      'content': text,
    });
    setState(() {
      messages.add({
        'senderId': widget.userId,
        'content': text,
        'timestamp': DateTime.now().toString(),
      });
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messaging')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, i) {
                final m = messages[i];
                final isMe = m['senderId'] == widget.userId;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(m['content'] ?? ''),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
