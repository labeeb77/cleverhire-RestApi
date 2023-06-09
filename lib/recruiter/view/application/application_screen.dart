import 'package:cleverhire/core/constraints/constraints.dart';
import 'package:cleverhire/recruiter/controller/api_services/delete_vacancy_services.dart';
import 'package:cleverhire/recruiter/controller/provider/get_created_vacancy_provider.dart';
import 'package:cleverhire/recruiter/view/application/application_details_and_update.dart';
import 'package:cleverhire/recruiter/view/application/create_new_vacancy.dart';
import 'package:cleverhire/recruiter/view/home/recruiter_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecruiterApplicationScreen extends StatelessWidget {
  const RecruiterApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<GetCreatedVacancyProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.fetchCreatedVacancies();
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Application"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<GetCreatedVacancyProvider>(
            builder: (context, value, child) {
          final reversedCreatedVacanciesList = value.createdVacancies!.reversed;
          return value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : value.createdVacancies == null
                  ? const SizedBox()
                  : ListView.separated(
                      itemBuilder: (context, index) => SizedBox(
                            height: 130,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ApplicationDetailsUpdateScreen()));
                              },
                              child: Card(
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        "https://static.vecteezy.com/system/resources/previews/004/263/114/original/meta-logo-meta-by-facebook-icon-editorial-logo-for-social-media-free-vector.jpg",
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  value.createdVacancies![index]
                                                      .position,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (ctx) =>
                                                                AlertDialog(
                                                                  content:
                                                                      const Text(
                                                                          "Are you sure to delete"),
                                                                  title:
                                                                      const Text(
                                                                    "Confirm..!",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                        onPressed:
                                                                            () async {
                                                                          await DeleteJobVacancyApiServices().deleteJobVacancy(value
                                                                              .createdVacancies![index]
                                                                              .id);
                                                                          value
                                                                              .fetchCreatedVacancies();

                                                                          Navigator.of(context)
                                                                              .pushReplacement(
                                                                            MaterialPageRoute(builder: (context) => RecruiterBottomNavigation()),
                                                                          );
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "Yes",
                                                                          style:
                                                                              TextStyle(color: Colors.red),
                                                                        )),
                                                                    TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: const Text(
                                                                            "No"))
                                                                  ],
                                                                ));
                                                  },
                                                  icon: const Icon(Icons.clear))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "${value.createdVacancies![index].salary}/-Monthly")
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
                      separatorBuilder: (context, index) => kHeight(5),
                      itemCount: value.createdVacancies!.length);
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateNewVacancyScreen()));
        },
        icon: const Icon(Icons.add_to_photos_rounded),
        label: const Text("Create new vacancy"),
      ),
    );
  }
}
