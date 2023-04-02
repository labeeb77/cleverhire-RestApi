import 'package:cleverhire/core/color/color.dart';
import 'package:cleverhire/recruiter/controller/provider/get_created_vacancy_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecruiterDetails extends StatelessWidget {
  RecruiterDetails({super.key, required this.index3});

  int index3;

  @override
  Widget build(BuildContext context) {
    return Consumer<GetCreatedVacancyProvider>(
      builder: (context, value, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Salary :",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                "${value.createdVacancies![index3].salary}/Monthly",
                style: const TextStyle(color: kMainColor),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Type :",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                value.createdVacancies![index3].type,
                style: TextStyle(color: kMainColor),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Location type:",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                value.createdVacancies![index3].locationType,
                style: TextStyle(color: kMainColor),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Position :",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                value.createdVacancies![index3].position,
                style: TextStyle(color: kMainColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
