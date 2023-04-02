import 'package:flutter/material.dart';

class AppliedJobs extends StatelessWidget {
  const AppliedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applied Jobs"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
