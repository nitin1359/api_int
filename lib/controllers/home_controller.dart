import 'package:get/get.dart';
import 'package:api_int/services/api_service.dart';
import 'package:api_int/models/story.dart';
import 'package:api_int/models/content_item.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  RxList<Story> stories = <Story>[].obs;
  RxList<ContentItem> contentItems = <ContentItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStories();
    fetchContentItems();
  }

  Future<void> fetchStories() async {
    stories.value = await _apiService.getStories();
  }

  Future<void> fetchContentItems() async {
    contentItems.value = await _apiService.getContentItems();
  }
}
