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
    try {
      final response = await dio.get('http://3.108.196.16/internal/mock?page=1&pageSize=5'); 
      if (response.statusCode == 200) {
        final data = response.data;
        final contentItems = data['stories'] as List<dynamic>; 
        return contentItems.map((item) => ContentItem.fromJson(item)).toList();
      } else {
        _showSnackbar('Error', 'Failed to fetch content items. Status code: ${response.statusCode}', Colors.red);
        return []; 
      }
    } catch (error) {
      _showSnackbar('Error', 'Network error: ${error.toString()}', Colors.red);
      return []; 
    }
  }

  void _showSnackbar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title, 
      message,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
