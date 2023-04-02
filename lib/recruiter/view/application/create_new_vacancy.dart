import 'package:cleverhire/job_seeker/view/Explore/explore_screen.dart';
import 'package:cleverhire/recruiter/controller/provider/create_vacancy_provider.dart';
import 'package:cleverhire/recruiter/view/application/application_screen.dart';
import 'package:cleverhire/recruiter/view/home/recruiter_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/color/color.dart';
import '../../../core/constraints/constraints.dart';
import '../../controller/provider/get_created_vacancy_provider.dart';

List<String> jobType = ["full-time", "part-time", "freelance"];
List<String> locationType = ["onsite", "remote", "hybrid"];

class CreateNewVacancyScreen extends StatelessWidget {
  CreateNewVacancyScreen({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Vacancy"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Consumer<CreateVacancyProvider>(
            builder: (context, value, child) => Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Open position"),
                  kHeight(5),
                  TextFormField(
                    controller: value.openPositionController,
                    decoration: InputDecoration(
                        hintText: "Name of the position",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: kMainColor),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // errorBorder: OutlineInputBorder(
                        //   borderSide: const BorderSide(color: Colors.red),
                        //   borderRadius: BorderRadius.circular(30),
                        // ),
                        isDense: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter position";
                      } else {
                        return null;
                      }
                    },
                  ),
                  kHeight(15),
                  const Text("Salary"),
                  kHeight(5),
                  TextFormField(
                      controller: value.salaryController,
                      decoration: InputDecoration(
                          hintText: "Salary per month",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kMainColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          // errorBorder: OutlineInputBorder(
                          //   borderSide: const BorderSide(color: Colors.red),
                          //   borderRadius: BorderRadius.circular(30),
                          // ),
                          isDense: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Salary";
                        } else {
                          return null;
                        }
                      }),
                  kHeight(15),
                  const Text("Location"),
                  kHeight(5),
                  SizedBox(
                    child: Center(
                      child: DropdownButtonFormField(
                        hint: const Text("Select Location type"),
                        isDense: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: kMainColor)),
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: kMainColor),
                                borderRadius: BorderRadius.circular(30))),
                        items: locationType
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (selectedLocation) {
                          value.selectedLocationType = selectedLocation;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select location";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  kHeight(15),
                  const Text("Type"),
                  kHeight(5),
                  SizedBox(
                    child: Center(
                      child: DropdownButtonFormField(
                        hint: const Text("Select job type"),
                        isDense: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: kMainColor)),
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(color: kMainColor),
                                borderRadius: BorderRadius.circular(30))),
                        items: jobType
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (selectedJob) {
                          value.selectedJobType = selectedJob;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select job type";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  kHeight(15),
                  const Text("Requirements"),
                  kHeight(10),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                          controller: value.requirementsController,
                          minLines: 5,
                          maxLines: 5,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: kMainColor)),
                              hintText: "add your requirements "),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter requirements";
                            } else {
                              return null;
                            }
                          }),
                    ),
                  ),
                  kHeight(40),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kMainColor),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              value.createVacancy();
                              value.disposeTextField();

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RecruiterBottomNavigation()));
                            }
                          },
                          child: const Text(
                            "Post job vacancy",
                            style: TextStyle(color: kWhiteColor),
                          )),
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
