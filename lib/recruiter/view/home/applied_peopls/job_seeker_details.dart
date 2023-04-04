import 'package:cleverhire/core/color/color.dart';
import 'package:cleverhire/recruiter/controller/provider/get_applied_people_provider.dart';
import 'package:cleverhire/recruiter/view/home/applied_peopls/see_appield_people_resume.dart';
import 'package:cleverhire/recruiter/view/home/widget/seeker_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<String> seekerStatus = [
  "Accept",
  "Schedule to interview",
  "Rejected"
];

class JobSeekerDetails extends StatelessWidget {
  JobSeekerDetails({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applicants"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Consumer<GetAppliedPeoplesProvider>(
          builder: (context, value, child) => Card(
            child: SizedBox(
              height: height / 1.3,
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
                    title: Text(
                      value.appliedPeoples![index].appliedBy.username,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  SeekerDetails(
                    index: index,
                  ),
                  SizedBox(
                      width: 250,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kMainColor),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ViewAppliedPeopleResumeScreen(
                                      index: index,
                                    )));
                          },
                          child: const Text("See Resume",
                              style: TextStyle(
                                  fontSize: 15, color: kWhiteColor)))),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: DropdownButtonFormField(
                            hint: const Text("Mark status as"),
                            isDense: true,
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor)),
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor),
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
        ),
      ),
    );
  }
}
