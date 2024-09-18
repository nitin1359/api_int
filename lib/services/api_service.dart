import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:api_int/models/story.dart';
import 'package:api_int/models/content_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<Story>> getStories() async {
    await Future.delayed(const Duration(milliseconds: 500));
    String data = await DefaultAssetBundle.of(Get.context!)
        .loadString('assets/stories.json');
    List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => Story.fromJson(item)).toList();
  }

  Future<List<ContentItem>> getContentItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    String data = await DefaultAssetBundle.of(Get.context!)
        .loadString('assets/content_items.json');
    List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => ContentItem.fromJson(item)).toList();
  }
}
