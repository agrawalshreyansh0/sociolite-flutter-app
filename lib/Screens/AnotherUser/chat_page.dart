import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sociolite/models/dummy_user.dart';
import 'package:sociolite/models/message.dart';
import 'package:sociolite/services/chat_services.dart';
import 'package:sociolite/utils/global_variables.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> chat = [];
  String userEmail = Globals.userEmail;
  String chatroom = "whatever";
  int page = 1;
  int limit = 20;
  String recieverId = '';
  String senderId = Globals.userId;
  bool first = true;
  ScrollController scroll = ScrollController();

  TextEditingController messageController = TextEditingController();
  IO.Socket socket = IO.io("http://3.110.30.120:5001", <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false
  });

  void addMessage() {
    socket.emit('send_message', {
      "message": messageController.text,
      "user_email": userEmail,
      "chatroom": chatroom
    });
    ChatService.sendMessage(
        senderId, recieverId, chatroom, messageController.text);
    messageController.text = '';
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
        Message newmessage = Message(
            senderId: senderId,
            recieverId: recieverId,
            text: data['message'].toString());
        chat = [newmessage, ...chat];
        setState(() {});
      });
    });
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener(_scrollListner);
  }

  _scrollListner() {
    if (scroll.position.pixels == scroll.position.maxScrollExtent) {
      fetchChats();
    }
  }

  getChatRoom(String user2) async {
    chatroom = await ChatService.getChatRoom(Globals.userId, user2);
    connect();
    fetchChats();
  }

  fetchChats() async {
    List<Message> newMessages =
        await ChatService.getChats(chatroom, limit, page);
    chat.addAll(newMessages);
    page++;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DummyUser user = ModalRoute.of(context)!.settings.arguments as DummyUser;
    if (first) {
      getChatRoom(user.id);
      recieverId = user.id;
      first = false;
    }

    return Material(
      child: SafeArea(
          child: Column(
        children: [
          Text(user.name, style: const TextStyle(fontSize: 30)),
          Container(
            height: 500,
            color: Colors.red,
            child: ListView.builder(
                controller: scroll,
                reverse: true,
                itemCount: chat.length,
                itemBuilder: (BuildContext context, index) {
                  var message = chat[index];
                  return Row(
                    children: [
                      message.senderId == recieverId ? Container() : const Spacer(),
                      Text(
                        message.text,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
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
