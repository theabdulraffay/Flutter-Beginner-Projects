import 'package:flutter/material.dart';
import 'package:new_temp_proj/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
User? user = _auth.currentUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  String message = '';

  // User? user;

  void getCurrentUser() {
    try {
      user = _auth.currentUser;
      // print(user!.email);
      // print(3424);
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messages = await firestore.collection('messages').get();
    for (var i in messages.docs) {
      print(i.data());
    }
  }

  void getMessagesStream() async {
    await for (var snapshot in firestore.collection('messages').snapshots()) {
      for (var i in snapshot.docs) {
        print(i.data());
      }
    }
    ;
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                // Implement logout functionality
                await _auth.signOut();
                Navigator.pop(context);
                // getMessagesStream();
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        message = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //message + user.email
                      controller.text = '';
                      //Implement send functionality.
                      // print(message);
                      // print(user!.email);
                      firestore
                          .collection('messages')
                          .add({'text': message, 'sender': user!.email});
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  const MessagesStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var messages = snapshot.data!.docs
              as List<QueryDocumentSnapshot<Map<String, dynamic>>>;

          List<Widget> messageText = [];
          for (var message in messages) {
            final text = message.data()['text'];
            final sender = message.data()['sender'];
            final currentUser = user!.email;
            if (currentUser != null) {
              bool isMe = currentUser == sender;

              final widget = MessageBubble(
                sender: sender,
                text: text,
                isMe: isMe,
              );
              messageText.add(widget);
            }
          }
          messageText.reversed;
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              children: messageText,
            ),
          );
        }
        return const Text('');
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  String sender;
  String text;
  bool isMe;
  MessageBubble(
      {super.key, this.sender = '', this.text = '', this.isMe = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                '$text',
                style: const TextStyle(color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
