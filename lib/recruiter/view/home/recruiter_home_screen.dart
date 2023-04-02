import 'package:carousel_slider/carousel_slider.dart';
import 'package:cleverhire/core/constraints/constraints.dart';
import 'package:cleverhire/recruiter/view/home/widget/job_vacancies_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/applied_people_card.dart';

class RecruiterHomeScreen extends StatelessWidget {
  const RecruiterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Padding(
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
            CarouselSlider.builder(
              itemCount: 4,
              itemBuilder: ((context, index, realIndex) => JobVacanciesCard()),
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2.7,
                  viewportFraction: 0.83,
                  enlargeFactor: 0.25),
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) => const AppliedPeopleCard(),
            ),
          ],
        ),
      ),
    );
  }
}
