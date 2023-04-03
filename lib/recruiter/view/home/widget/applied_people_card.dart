import 'package:cleverhire/recruiter/controller/provider/get_applied_people_provider.dart';
import 'package:cleverhire/recruiter/controller/provider/get_created_vacancy_provider.dart';
import 'package:cleverhire/recruiter/view/home/applied_peopls/job_seeker_details.dart';
import 'package:cleverhire/recruiter/view/home/applied_peopls/see_appield_people_resume.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppliedPeopleCard extends StatelessWidget {
  AppliedPeopleCard({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer2<GetAppliedPeoplesProvider, GetCreatedVacancyProvider>(
        builder: (context, value, value2, child) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: value.appliedPeoples == null
              ? SizedBox()
              : Column(
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
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: const Text("Flutter developer"),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ViewAppliedPeopleResumeScreen(
                                        index: index,
                                      )));
                            },
                            child: const Text("See Resume")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const JobSeekerDetails()));
                            },
                            child: const Text("See Details"))
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
