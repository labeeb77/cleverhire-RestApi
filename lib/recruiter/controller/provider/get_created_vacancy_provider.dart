import 'package:cleverhire/recruiter/controller/api_services/get_created_vacancy.dart';
import 'package:cleverhire/recruiter/model/create_vacancy_model/create_vacancy_res_model.dart';
import 'package:flutter/foundation.dart';

class GetCreatedVacancyProvider with ChangeNotifier {
  List<CreateVacancyResModel>? createdVacancies;
  bool isLoading = false;
  int? indexId = 0;
  Future<void> fetchCreatedVacancies() async {
    isLoading = true;
    notifyListeners();
    final apiServices = GetCreatedVacancyApiServices();
    await apiServices.getCreatedVacancy().then((value) {
      createdVacancies = value;
      notifyListeners();
      isLoading = false;
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
    // log(createdVacancies.toString());
  }
}
