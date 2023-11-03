import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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

  void requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      print('Permission is granted');
    } else if (status.isDenied) {
      if (await Permission.camera.request().isGranted) {
        print('Permission was granted');
      }
    }
  }

  void requestMultiplePermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.phone,
      Permission.videos
    ].request();
    print('location permission:${statuses[Permission.location]},'
        'storage permission:${statuses[Permission.storage]}');
  }

  void requestPermissionWithOpenSettings() async {
    openAppSettings();
  }
}
