import 'package:api_int/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryBar extends StatelessWidget {
  final HomeController controller = Get.find();

  StoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.stories.length,
            itemBuilder: (context, index) {
              final story = controller.stories[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(story.imageUrl),
                    ),
                    const SizedBox(height: 4),
                    Text(story.username, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              );
            },
          )),
    );
  }
}
