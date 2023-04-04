import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cleverhire/core/constraints/constraints.dart';
import 'package:cleverhire/recruiter/controller/provider/get_applied_people_provider.dart';
import 'package:cleverhire/recruiter/controller/provider/get_created_vacancy_provider.dart';
import 'package:cleverhire/recruiter/view/home/widget/job_vacancies_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'widget/applied_people_card.dart';

class RecruiterHomeScreen extends StatelessWidget {
  const RecruiterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<GetCreatedVacancyProvider>(context, listen: false);
    final provider2 =
        Provider.of<GetAppliedPeoplesProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await provider.fetchCreatedVacancies();
      provider2.fetchingAppliedPeople(provider.createdVacancies![0].id);
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Consumer2<GetCreatedVacancyProvider, GetAppliedPeoplesProvider>(
        builder: (context, value, value2, child) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const CupertinoSearchTextField(),
              kHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Vacancies",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all"))
                ],
              ),
              value.isLoading
                  ? Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 51, 51, 51),
                      highlightColor: const Color.fromARGB(255, 125, 125, 125),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Row(
                          children: [
                            Card(
                              child: SizedBox(
                                width: 100.0,
                                height: 90.0,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.grey,
                                  child: const SizedBox(
                                    height: 100,
                                    width: 39,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Card(
                                  child: SizedBox(
                                    width: 200.0,
                                    height: 20.0,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.black12,
                                      highlightColor: Colors.grey,
                                      child: const SizedBox(
                                        height: 100,
                                        width: 39,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Card(
                                      child: SizedBox(
                                        width: 150.0,
                                        height: 20.0,
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.black12,
                                          highlightColor: Colors.grey,
                                          child: const SizedBox(
                                            height: 100,
                                            width: 39,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : value.createdVacancies == null
                      ? const SizedBox()
                      : CarouselSlider.builder(
                          carouselController: CarouselController(),
                          itemBuilder: ((context, index, realIndex) =>
                              JobVacanciesCard(
                                index1: index,
                              )),
                          itemCount: provider.createdVacancies!.length,
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            aspectRatio: 2.7,
                            viewportFraction: 0.83,
                            enlargeFactor: 0.25,
                            onPageChanged: (index, reason) {
                              value.indexId = index;
                              value.notifyListeners();
                              value2.fetchingAppliedPeople(
                                  value.createdVacancies![value.indexId!].id);
                              log("::::::::::${value.indexId.toString()}");
                            },
                          ),
                        ),
              kHeight(20),
              Row(
                children: const [
                  Text(
                    "Recently applied people",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              kHeight(10),
              value2.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : value.createdVacancies == null
                      ? const SizedBox()
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value2.appliedPeoples!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => AppliedPeopleCard(
                            index: index,
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
