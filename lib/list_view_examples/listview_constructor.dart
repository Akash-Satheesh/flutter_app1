import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ListView1(),
  ));
}

class ListView1 extends StatelessWidget {
  const ListView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text('Listview 1'),
      //  ),
      body: ListView(
        children: [
          Card(
              child: ListTile(
            title: Text('product 1'),
            subtitle: Row(
              children: [
                Icon(Icons.read_more),
                Text('This is sample text'),
              ],
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1693944845064-310c0a66bba7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDExfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60"),
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('10.11'),
                CircleAvatar(
                  minRadius: 6,
                  maxRadius: 10,
                  backgroundColor: Colors.green,
                  child: Text('2'),
                )
              ],
            ),
          )),
          Card(
              child: ListTile(
            title: Text('product 2'),
            subtitle: Text('This is sample text'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1693944845064-310c0a66bba7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDExfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60"),
            ),
            trailing: Text('10.11'),
          )),
          Card(
              child: ListTile(
            title: Text('product 3'),
            subtitle: Text('This is sample text'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1693944845064-310c0a66bba7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDExfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60"),
            ),
            trailing: Text('10.11'),
          )),
          Card(
              child: ListTile(
            title: Text('product 4'),
            subtitle: Text('This is sample text'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1693944845064-310c0a66bba7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDExfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60"),
            ),
            trailing: Text('10.11'),
          )),
          Card(
              child: ListTile(
            title: Text('product 5'),
            subtitle: Text('This is sample text'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1693944845064-310c0a66bba7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDExfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60"),
            ),
            trailing: Text('10.11'),
          )),
        ],
      ),
    );
  }
}
