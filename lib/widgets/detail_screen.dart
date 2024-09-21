import 'package:api_int/models/content_item.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final ContentItem contentItem;

  const DetailScreen({super.key, required this.contentItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contentItem.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(contentItem.thumbnail))),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // CircleAvatar(
                      //   backgroundImage:
                      //       NetworkImage(contentItem.user.profileImage),
                      //   radius: 20,
                      // ),
                      const SizedBox(width: 8),
                      // Text(contentItem.user.username),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    contentItem.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(contentItem.content),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.favorite),
                      const SizedBox(width: 4),
                      // Text('${contentItem.likes}'),
                      const SizedBox(width: 16),
                      const Icon(Icons.comment),
                      const SizedBox(width: 4),
                      // Text('${contentItem.comments}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
