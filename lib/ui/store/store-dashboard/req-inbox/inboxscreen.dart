import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:finalproject/ui/inbox/individual_chat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../sharedWidgets/DashboardBottomBar.dart';
import 'inboxscreen_model.dart';

class ReqChatPage extends StatefulWidget {
  @override
  _ReqChatPageState createState() => _ReqChatPageState();
}

class _ReqChatPageState extends State<ReqChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageURL: "images/userImage1.jpeg",
        time: "now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageURL: "images/userImage2.jpeg",
        time: "now"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageURL: "images/userImage3.jpeg",
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "images/userImage4.jpeg",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageURL: "images/userImage5.jpeg",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageURL: "images/userImage6.jpeg",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageURL: "images/userImage7.jpeg",
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        imageURL: "images/userImage8.jpeg",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // automaticallyImplyLeading: false,
        backgroundColor: Color(0xfffafafa),
        centerTitle: true,
        // Text('test')
        title: Text(
          AppLocalizations.of(context).messages,
          style: Theme.of(context).textTheme.headline5,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        // backgroundColor: Color(0xffffffff),
        // bottomOpacity: 0.4,
        // toolbarOpacity: 0.4,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SafeArea(
            //   child: Padding(
            //     padding: EdgeInsets.all(8),
            //     child: Text(
            //       AppLocalizations.of(context).messages,
            //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),

            Row(
              // children: [CustomButton()],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  height: 60,
                  text: AppLocalizations.of(context).all,
                  primary: Theme.of(context).highlightColor,
                  onprimary: Theme.of(context).primaryColor,
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  height: 60,
                  text: AppLocalizations.of(context).archived,
                  primary: Theme.of(context).highlightColor,
                  onprimary: Theme.of(context).primaryColor,
                ),
                // Text("data")
                // ElevatedButton(onPressed: null, child: Text("hi"))
              ],
            ),
            chatUsers.length > 1
                ? ListView.builder(
                    itemCount: chatUsers.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black12))),
                        child: ConversationList(
                          name: chatUsers[index].name,
                          messageText: chatUsers[index].messageText,
                          imageUrl: chatUsers[index].imageURL,
                          time: chatUsers[index].time,
                          isMessageRead:
                              (index == 0 || index == 3) ? true : false,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Individual_chat(),
                                    settings: RouteSettings(
                                        arguments: chatUsers[index])));
                          },
                        ),
                      );
                    },
                  )
                : Image.asset('assets/image 4.jpg'),
          ],
        ),
      ),
      bottomNavigationBar:
          Container(child: DashboardBottomBar(selectedIndex: 2)),
    );
  }
}

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  Function onTap = () {};

  ConversationList(
      {@required this.name,
      @required this.messageText,
      @required this.imageUrl,
      @required this.time,
      @required this.isMessageRead,
      this.onTap});

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
