import 'package:flutter/material.dart';

class ChatDetail extends StatefulWidget {
  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  List<Map<String,Object>> messages = [
    {
      "sender":"Farida",
      "message":"Hari ini belajar apa?"
    },
    {
      "sender":"Muzaffar",
      "message":"Hari ini belajar Firebase"
    },
    {
      "sender":"Farida",
      "message":"Ok buka ofis awal sikit pagi ni!"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Message"
                  ),
                ),
              ),
              FlatButton.icon(onPressed: (){

              },
                  icon: Icon(Icons.arrow_right),
                  label: Text("Send"))
            ],
          ),
          Expanded(
              child:ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context,position){
                    return ListTile(
                        title: Text(messages[position]["message"]),
                        subtitle: Text(messages[position]["sender"])
                    );
                  })
          )

        ],
      ),
    );
  }
}
