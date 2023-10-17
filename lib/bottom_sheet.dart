import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: BottomSheetEx(),
  ));
}

class BottomSheetEx extends StatelessWidget {
  const BottomSheetEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet'),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Share via',
                        style: TextStyle(fontSize: 20),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                        ),
                        title: Text('Whatsapp'),
                      ),
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.pink,
                        ),
                        title: Text('Instagram'),
                      )
                    ],
                  );
                });
          },
          child: Image.network(
              'https://images.unsplash.com/photo-1696392838000-092276189f47?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDd8Qm4tRGpyY0Jyd298fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),
        ),
      ),
    );
  }
}
