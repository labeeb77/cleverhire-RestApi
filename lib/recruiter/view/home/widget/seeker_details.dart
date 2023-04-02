import 'package:flutter/material.dart';

class SeekerDetails extends StatelessWidget {
  const SeekerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Name : ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text("Jasir Ali")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Email : ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text("alijasir051@gmail.com")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Date of birth : ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text("00/00/1000")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Qualification : ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text("BCA")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Occupation : ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text("Flutter developer")
            ],
          ),
        ],
      ),
    );
  }
}
