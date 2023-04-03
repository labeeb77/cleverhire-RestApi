import 'package:cleverhire/core/color/color.dart';
import 'package:cleverhire/recruiter/view/home/widget/seeker_details.dart';
import 'package:flutter/material.dart';

const List<String> seekerStatus = [
  "Accept",
  "Schedule to interview",
  "Rejected"
];

class JobSeekerDetails extends StatelessWidget {
  const JobSeekerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applicants"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Image.asset(
                    "assets/profile.png",
                  ),
                ),
                title: const Text(
                  "Jasir Ali",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: const Text("Flutter developer"),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chat,
                      color: kTextFieldColor,
                    )),
              ),
              const Divider(),
              const SeekerDetails(),
              SizedBox(
                  width: 250,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: kMainColor),
                      onPressed: () {},
                      child: const Text("See Resume",
                          style: TextStyle(fontSize: 15, color: kWhiteColor)))),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: DropdownButtonFormField(
                        hint: const Text("Mark status as"),
                        isDense: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kMainColor)),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: kMainColor),
                            )),
                        items: seekerStatus
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {}),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
