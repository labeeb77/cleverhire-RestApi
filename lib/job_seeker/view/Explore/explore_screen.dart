import 'package:cleverhire/core/color/color.dart';
import 'package:cleverhire/core/constraints/constraints.dart';
import 'package:cleverhire/recruiter/controller/provider/get_created_vacancy_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'job_details_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<GetCreatedVacancyProvider>(context, listen: false)
            .fetchCreatedVacancies();
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                const CupertinoSearchTextField(),
                kHeight(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Job Recommendation",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Saved jobs",
                          style: TextStyle(color: kMainColor),
                        ))
                  ],
                ),
                kHeight(10),
                Consumer<GetCreatedVacancyProvider>(
                    builder: (context, value, child) {
                  return value.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : value.createdVacancies == null
                          ? const SizedBox()
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  JobDetailsAndApply(
                                                    index2: index,
                                                  )));
                                    },
                                    child: Consumer<GetCreatedVacancyProvider>(
                                      builder: (context, value, child) =>
                                          SizedBox(
                                        height: 130,
                                        // width: 340,
                                        child: Card(
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.network(
                                                  "https://pbs.twimg.com/profile_images/1493919551553167360/XIoPFoOK_400x400.jpg",
                                                  height: 90,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            value
                                                                .createdVacancies![
                                                                    index]
                                                                .position,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                              Icons
                                                                  .bookmark_border_outlined,
                                                              color: kMainColor,
                                                            ))
                                                        // Container(
                                                        //   decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(10),
                                                        //     color: kTextFieldColor,
                                                        //   ),
                                                        //   height: 20,
                                                        //   width: 50,
                                                        //   child: const Center(child: Text("Active")),
                                                        // )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            "${value.createdVacancies![index].company}")
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            "${value.createdVacancies![index].type} / ${value.createdVacancies![index].locationType}",
                                                            style: const TextStyle(
                                                                color:
                                                                    kMainColor)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                              separatorBuilder: (context, index) => kHeight(5),
                              itemCount: value.createdVacancies!.length);
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
