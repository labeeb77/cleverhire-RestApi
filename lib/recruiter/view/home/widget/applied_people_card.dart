import 'package:cleverhire/recruiter/view/home/job_seeker_details.dart';
import 'package:flutter/material.dart';

class AppliedPeopleCard extends StatelessWidget {
  const AppliedPeopleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
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
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text("See Resume")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const JobSeekerDetails()));
                    },
                    child: const Text("See Details"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
