import 'dart:developer';

import 'package:cleverhire/job_seeker/controller/apiServices/seeker_login_services.dart';
import 'package:cleverhire/job_seeker/controller/firebase/storage_services.dart';
import 'package:cleverhire/job_seeker/model/seeker_login_req_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SeekerLoginProvider with ChangeNotifier {
  TextEditingController addressController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  String? selectedDate;
  bool isLoading = false;
  Future seekerLogin(BuildContext context) async {
    final providerFirebase =
        Provider.of<FirebaseStorageProvider>(context, listen: false);
    isLoading = true;
    final address = addressController.text.trim();
    final occupation = occupationController.text.trim();

    final seekerLogin = SeekerReqModel(
        dateOfBirth: selectedDate!,
        address: address,
        occupation: occupation,
        profileImage: providerFirebase.downloadUrl);

    SeekerLoginApiServices().seekerLoginServices(seekerLogin);
  }

  void datePick(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      log(pickedDate.toString());
    }

    selectedDate = DateFormat("yyyy-MM-dd").format(pickedDate!);
    log(selectedDate.toString());
    notifyListeners();
  }
}
