import 'package:flutter/material.dart';
import 'package:flutter_test1/sevices/http_services.dart';
import 'package:http/http.dart';

class DealerDefinition {
  String category;
  String parameter;
  String parameterDetails;
  String type;
  String list;

  DealerDefinition({
    required this.category,
    required this.parameter,
    required this.parameterDetails,
    required this.type,
    required this.list,
  });
}

List<String> categoryOptions = [];

fetchCategoryOptions() async {
  Map<String, Object> body = {
    "categoryId": '1',
    "modifyUser": '1',
  };
  final response = await HttpService().postRequest("activeCategory", body);
  print('response:------------$response');

  final response2 = await HttpService().putRequest("updateUser", body);
  print(response2);
}
