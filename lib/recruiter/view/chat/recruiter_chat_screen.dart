import 'package:flutter/material.dart';

class RecruiterChatScreen extends StatelessWidget {
  const RecruiterChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Chat Box"),
      ),
      body: Center(
        child: Text("Chat screen"),
      ),
    );
  }
}
