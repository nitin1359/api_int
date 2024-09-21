import 'package:get/get.dart';
import 'package:api_int/services/api_service.dart';
import 'package:api_int/models/story.dart';
import 'package:api_int/models/content_item.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  RxList<Story> stories = <Story>[].obs;
  RxList<ContentItem> contentItems = <ContentItem>[].obs;
  var isLoading = false.obs; 
  var hasError = false.obs;
  var currentPage = 1.obs;
  final int totalPages = 3;

  @override
  void onInit() {
    super.onInit();
    fetchStories();
    loadMoreContent();
  }

  Future<void> fetchStories() async {
    stories.value = await _apiService.getStories();
  }

  void loadMoreContent() async {
    if (currentPage.value <= totalPages) {
      isLoading.value = true;
      hasError.value = false; 

      try {
        List<ContentItem> newContent = await _apiService.getContentItems(currentPage.value);
        if (newContent.isNotEmpty) {
          contentItems.addAll(newContent);
          currentPage.value++;
        }
      } catch (error) {
        hasError.value = true;
      } finally {
        isLoading.value = false;
      }
    }
  }

  void retryLoadingContent() {
    if (hasError.value) {
      loadMoreContent();
    }
  }
  
}
