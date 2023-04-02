import 'package:cleverhire/core/constraints/constraints.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(onPressed: () {}, child: const Text("Post")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                kWidth(5),
                CircleAvatar(child: Image.asset("assets/profile.png")),
                kWidth(10),
                const Text(
                  "Jasir ali",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            kHeight(15),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  minLines: 7,
                  maxLines: 7,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "What you want to talk about?"),
                ),
              ),
            ),
            kHeight(10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.photo_size_select_actual_rounded),
              label: const Text("Add a Photo"),
            )
          ],
        ),
      ),
    );
  }
}
