import 'package:flutter/material.dart';

import '../../../../core/color/color.dart';

class JobVacanciesCard extends StatelessWidget {
  const JobVacanciesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      // width: 340,
      child: Card(
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://pbs.twimg.com/profile_images/1493919551553167360/XIoPFoOK_400x400.jpg",
                height: 90,
              ),
            ),
            SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Flutter developer",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kTextFieldColor,
                        ),
                        height: 20,
                        width: 50,
                        child: const Center(child: Text("Active")),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("IBM"), Text(" 3-6 LPA")],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}