import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: const <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Reinaldo Trindade"),
              accountEmail: Text("rewifetri@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1530925486883-d9da662d497c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG1vdG9jeWNsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"))),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text("List 1"),
            subtitle: Text("List 1"),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("List 2"),
            subtitle: Text("List 2"),
          )
        ],
      ),
    );
  }
}
