import 'package:chat_app/chat_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  //store who is log in at the moment
  final String userId;

  ChatList({this.userId});

 // List<String> users = [
   // "Aiman",
    //"Zain",
    //"Soo Tek Wei",
    //"Nabil"

  //];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: StreamBuilder(
        stream: Firestore.instance.collection('users').snapshots(),
        //ignore:missing_return
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          else{
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,position){
                  if(snapshot.data.documents[position]["id"] == this.userId)
                    return Container();
                  else
                  return ListTile(
                    title: Text(snapshot.data.documents[position]["email"]),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatDetail()),
                      );
                    },
                  );
                });
          }
        })
    );

}
}
