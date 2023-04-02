import 'package:flutter/material.dart';

import '../../../core/color/color.dart';
import '../../../core/constraints/constraints.dart';

class ApplicationDetailsUpdateScreen extends StatelessWidget {
  const ApplicationDetailsUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Open position"),
              kHeight(5),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Junior developer",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kMainColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    isDense: true),
              ),
              kHeight(15),
              const Text("Salary"),
              kHeight(5),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "35-40k",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kMainColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    isDense: true),
              ),
              kHeight(15),
              const Text("Location"),
              kHeight(5),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "remote",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kMainColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    isDense: true),
              ),
              kHeight(15),
              const Text("Type"),
              kHeight(5),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "flutter developer",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kMainColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    isDense: true),
              ),
              kHeight(15),
              const Text("Requirements"),
              kHeight(10),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    minLines: 5,
                    maxLines: 5,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: kMainColor)),
                        hintText:
                            "0-2 years of experience\nblock state management\nproblem solving skill\nleadership quality"),
                  ),
                ),
              ),
              kHeight(40),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: kMainColor),
                      onPressed: () {},
                      child: const Text(
                        "Update Vacancy",
                        style: TextStyle(color: kWhiteColor),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
