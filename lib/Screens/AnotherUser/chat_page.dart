import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sociolite/models/dummy_user.dart';
import 'package:sociolite/utils/global_variables.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> chat = [];
  String userEmail = Globals.userEmail;
  String chatroom = "whatever";

  TextEditingController messageController = TextEditingController();
  IO.Socket socket = IO.io("http://192.168.1.9:5001", <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false
  });

  void addMessage() {
    socket.emit('send_message', {
      "message": messageController.text,
      "user_email": userEmail,
      "chatroom": chatroom
    });
    // chat.add(messageController.text);
  }

  connect() {
    socket.connect();

    socket.emit('join_room', {'chatroom': chatroom, "user_email": userEmail});

    socket.onConnect((data) {
      log('connected to the chat server');

      socket.on('user_joined', (data) {
        log(data.toString()); 
      });

      socket.on('recieve_message', (data) {
        log(data.toString());
        chat.add(data['message'].toString());
        log(chat.toString());
        setState(() {});
      });
    });
  }

  @override
  void initState() {
    super.initState();
    connect();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DummyUser user = ModalRoute.of(context)!.settings.arguments as DummyUser;

    return Material(
      child: SafeArea(
          child: Column(
        children: [
          Text(user.name, style: const TextStyle(fontSize: 30)),
          Container(
            height: 500,
            color: Colors.red,
            child: ListView.builder(
                itemCount: chat.length,
                itemBuilder: (BuildContext context, index) {
                  return Text(
                    chat[index],
                    style: const TextStyle(fontSize: 30),
                  );
                }),
          ),
          const Spacer(),
          TextField(
            controller: messageController,
          ),
          ElevatedButton(
            onPressed: () => addMessage(),
            child: const Text("Send Message"),
          ),
          const SizedBox(height: 100)
        ],
      )),
    );
  }
}
