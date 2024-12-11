import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.alarm,
        ),
        title: const Text(
          'Hello World!',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.library_add),
            onPressed: () {
              print('add');
            },
          ),
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {
              print('hello');
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
    );
  }
}
