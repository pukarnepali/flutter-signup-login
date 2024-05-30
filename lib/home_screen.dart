import 'package:flutter/material.dart';
import 'package:sign_up/local_storage.dart';
import 'package:sign_up/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              StorageHelper storage = StorageHelper();
              storage.saveData(false);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (Route) => (false),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text("Welcome to home page"),
      ),
    );
  }
}
