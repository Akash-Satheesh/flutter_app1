import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: PermissionHandle(),
  ));
}

class PermissionHandle extends StatelessWidget {
  const PermissionHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Handler'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: requestCameraPermission,
                child: const Text(
                  'Request Camera permission',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: requestMultiplePermission,
                child: const Text(
                  'Request Multiple permissions',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: requestPermissionWithOpenSettings,
                child: const Text(
                  'Open Permission settings',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void requestCameraPermission() {}

  void requestMultiplePermission() {}

  void requestPermissionWithOpenSettings() {}
}
