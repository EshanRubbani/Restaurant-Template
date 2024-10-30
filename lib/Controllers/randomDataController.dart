import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restro_web/GLobals/constants.dart';

class DataController extends GetxController {
  var items = <Map<String, dynamic>>[].obs; // Observable list to store items
  var imgData = <String>[].obs; // Observable list to store image data
  var isLoaded = false.obs; // Observable to track if data is loaded
  Dio dio = Dio(); // Dio instance

  @override
  void onInit() {
    super.onInit();
    fetchItems(); // Fetch items when the controller initializes
  }

  Future<void> fetchItems() async {
    // Your existing fetching logic goes here...
    List<String> itemNumbers = [
      "'Appt_0000000011'",
      "'Appt_0000000020'",
      "'Appt_0000000021'",
      "'Appt_0000000025'",
      "'BEVERAGE_000004'",
      "'BEVERAGE_000006'",
      "'BEVERAGE_000010'",
      "'BURGERS_0000005'",
      "'BURGERS_0000006'",
      "'BURGERS_0000012'"
    ];

    List<String> itemNumbersforimage = [
      'Appt_0000000011',
      'Appt_0000000020',
      'Appt_0000000021',
      'Appt_0000000025',
      'BEVERAGE_000004',
      'BEVERAGE_000006',
      'BEVERAGE_000010',
      'BURGERS_0000005',
      'BURGERS_0000006',
      'BURGERS_0000012'
    ];

    String token = ApiConstants.token;
    String url = 'https://cloudapi.ovvihq.com/api/OnlineAPIOrder/GetItemDetailbyItemNumbers';

    var headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    try {
      List<Map<String, dynamic>> fetchedItems = [];
      List<String> fetchedImgContent = [];

      for (String itemNumber in itemNumbers) {
        var body = json.encode({"ItemNumber": itemNumber});
        var request = http.Request('POST', Uri.parse(url))
          ..body = body
          ..headers.addAll(headers);
        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          String responseBody = await response.stream.bytesToString();
          var data = json.decode(responseBody);
          if (data.isNotEmpty) {
            fetchedItems.add(data[0]);
          }
        }
      }

      for (String itemNumber in itemNumbersforimage) {
        String imageBase64 = await fetchImageFromApi(itemNumber);
        fetchedImgContent.add(imageBase64);
      }

      items.value = fetchedItems;
      imgData.value = fetchedImgContent;
      isLoaded.value = true;
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<String> fetchImageFromApi(String itemNumber) async {
    String url = "${ApiConstants.GetImageByItemNumber}$itemNumber";
    String token = ApiConstants.token;

    try {
      final response = await dio.get(url, options: Options(headers: {'Authorization': token}));
      dynamic responseData = response.data;
      if (responseData is String) {
        responseData = json.decode(responseData);
      }
      if (responseData.containsKey('Base64String') && responseData['Base64String'].isNotEmpty) {
        return responseData['Base64String'].replaceFirst('data:image/jpg;base64,', '');
      }
      return '';
    } catch (e) {
      print('Error fetching image: $e');
      return '';
    }
  }
}
