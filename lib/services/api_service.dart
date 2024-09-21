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

  Future<List<ContentItem>> getContentItems(int page) async {
  try {
    final response = await dio.get('http://3.108.196.16/internal/mock?page=$page&pageSize=5');
    
    if (response.statusCode == 200) {
      final data = response.data;
      final contentItems = data['stories'] as List<dynamic>;
      return contentItems.map((item) => ContentItem.fromJson(item)).toList();
    } else {
      _handleHttpError(response.statusCode!);
    }
  } on DioException catch (dioException) {
    _handleDioError(dioException);
  } catch (error) {
    _showSnackbar('Error', 'An unknown error occurred: ${error.toString()}', Colors.red);
  }

  return []; 
}

void _handleHttpError(int statusCode) {
  switch (statusCode) {
    case 400:
      _showSnackbar('Error', 'Bad Request. Please try again later.', Colors.red);
      break;
    case 401:
      _showSnackbar('Unauthorized', 'You are not authorized. Please login.', Colors.orange);
      break;
    case 500:
      _showSnackbar('Server Error', 'Internal server error. Try again later.', Colors.red);
      break;
    default:
      _showSnackbar('Error', 'Unexpected error: $statusCode', Colors.red);
  }
}

void _handleDioError(DioException dioException) {
  if (dioException.type == DioExceptionType.connectionTimeout ||
      dioException.type == DioExceptionType.receiveTimeout ||
      dioException.type == DioExceptionType.connectionError) {
    _showSnackbar('Network Error', 'Please check your internet connection.', Colors.red);
  } else {
    _showSnackbar('Error', 'Unexpected error: ${dioException.message}', Colors.red);
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
