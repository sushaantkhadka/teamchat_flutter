import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teamchat/pages/group_info.dart';
import 'package:teamchat/service/database_service.dart';
import 'package:teamchat/widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const ChatPage(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.userName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream<QuerySnapshot>? chats;

  String admin = "";

  @override
  void initState() {
    getChatandAdmin();
    // TODO: implement initState
    super.initState();
  }

  getChatandAdmin() {
    DatabaseService().getChat(widget.groupId).then((val) {
      setState(() {
        chats = val;
      });
    });
    DatabaseService().getGroupAdmin(widget.groupId).then((val) {
      setState(() {
        admin = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(
                  context,
                  GroupInfo(
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                      adminName: admin));
            },
            icon: const Icon(
              Icons.info,
            ),
          )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          widget.groupName,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text("This is a chatpage"),
      ),
    );
  }
}
