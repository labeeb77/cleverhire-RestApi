import 'dart:developer';

import 'package:cleverhire/recruiter/controller/api_services/create_vacancy_services.dart';
import 'package:cleverhire/recruiter/model/create_vacancy_model/create_vacancy_model.dart';
import 'package:flutter/material.dart';

class CreateVacancyProvider with ChangeNotifier {
  TextEditingController openPositionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  // TextEditingController locationTypeController = TextEditingController();
  // TextEditingController jobTypeController = TextEditingController();
  TextEditingController requirementsController = TextEditingController();
  String? selectedJobType;
  String? selectedLocationType;

  bool isLeading = false;
  Future createVacancy() async {
    isLeading = true;
    final position = openPositionController.text.trim();
    final salary = salaryController.text.trim();
    // final locationType = locationTypeController.text.trim();
    // final type = jobTypeController.text.trim();
    final requirements = requirementsController.text.trim();
    final createdVacancy = CreateVacancyModel(
        position: position,
        salary: int.parse(salary),
        locationType: selectedLocationType!,
        type: selectedJobType!,
        description: requirements);
    CreateVacancyApiServices().creatingVacancy(createdVacancy);
  }

  void disposeTextField() {
    openPositionController.clear();
    requirementsController.clear();
    salaryController.clear();
  }
}
