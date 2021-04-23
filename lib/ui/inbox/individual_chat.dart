import 'package:finalproject/models/inboxscreen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Individual_chat extends StatefulWidget {
  @override
  _Individual_chatState createState() => _Individual_chatState();
}

class _Individual_chatState extends State<Individual_chat> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello hi byebye", messageType: "receiver"),
    ChatMessage(messageContent: "How about 200 L.E ?", messageType: "receiver"),
    ChatMessage(messageContent: "No,🥱", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  String message = '';

  onEmailChange(value) {
    setState(() {
      message = value.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ChatUsers instance = ModalRoute.of(context).settings.arguments;
    debugPrint('test: $instance');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(instance.imageURL),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        instance.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        instance.time,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType == "receiver"
                            ? Colors.grey.shade200
                            : Colors.orange[100]),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.attach_file,
                  color: Theme.of(context).accentColor,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "type...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  messages.add(ChatMessage(
                      messageContent: "is there any thing wrong?",
                      messageType: "sender"));
                  debugPrint('$message');
                });
              },
              child: Icon(
                Icons.send_sharp,
                color: Theme.of(context).accentColor,
                size: 18,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
