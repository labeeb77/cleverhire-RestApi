import 'package:cleverhire/core/color/color.dart';
import 'package:cleverhire/core/constraints/constraints.dart';
import 'package:cleverhire/job_seeker/view/home/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddPostScreen()));
                },
                icon: const Icon(Icons.add_to_photos))
          ],
          title: const Text("Home"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text("Jasir ali"),
                            subtitle: const Text("Flutter developer"),
                            leading: CircleAvatar(
                                child: Image.asset("assets/profile.png")),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.horizontal_split_sharp)),
                          ),
                          Image.network(
                            "https://cdn.sanity.io/images/s7xbv9bz/production/1562d4dae8dc03456edca898e89c0f39ae086a8f-1600x1000.png",
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          const Divider(),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                ReadMoreText(
                                  "Flutter is an open-source mobile application development framework created by Google. It allows developers to create high-quality native interfaces on iOS and Android platforms using a single codebase written in the Dart programming language.",
                                  trimLines: 1,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: "Show More",
                                  trimExpandedText: " Show Less",
                                  moreStyle: TextStyle(color: kMainColor),
                                  lessStyle: TextStyle(color: kMainColor),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.thumb_up_alt_outlined)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.chat_outlined)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share_outlined))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => kHeight(5),
            itemCount: 5));
  }
}
