import 'package:cleverhire/core/color/color.dart';
import 'package:cleverhire/core/constraints/constraints.dart';
import 'package:cleverhire/job_seeker/view/Explore/resume_uploading_screen.dart';
import 'package:cleverhire/job_seeker/view/Explore/widget/recruiter_details.dart';
import 'package:cleverhire/recruiter/controller/provider/get_created_vacancy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobDetailsAndApply extends StatelessWidget {
  JobDetailsAndApply({
    super.key,
    required this.index2,
  });

  int index2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Job details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer<GetCreatedVacancyProvider>(
          builder: (context, value, child) => Column(
            children: [
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://pbs.twimg.com/profile_images/1493919551553167360/XIoPFoOK_400x400.jpg",
                          height: 90,
                        ),
                      ),
                      kWidth(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.createdVacancies![index2].position,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("${value.createdVacancies![index2].company}")
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Divider(),
              kHeight(20),
              RecruiterDetails(
                index3: index2,
              ),
              kHeight(20),
              const Divider(),
              kHeight(20),
              Row(
                children: const [
                  Text(
                    "Requirements",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              kHeight(20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      value.createdVacancies![index2].description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: kMainColor),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResumeUpload(
                                  index4: index2,
                                )));
                      },
                      child: const Text(
                        "Apply Now",
                        style: TextStyle(fontSize: 18, color: kWhiteColor),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
