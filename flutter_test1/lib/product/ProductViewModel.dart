import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  // Define the properties for the product
  late String _category;
  late String _modelType;
  late String _productStatus;
  late String _deviceId;
  late String _description;
  late String _warranty;
  late DateTime _currentDate;

  // Getters for the properties
  String get category => _category;
  String get modelType => _modelType;
  String get productStatus => _productStatus;
  String get deviceId => _deviceId;
  String get description => _description;
  String get warranty => _warranty;
  DateTime get currentDate => _currentDate;

  // Update methods for the properties
  void updateProductCategory(String category) {
    _category = category ?? "";
    notifyListeners();
  }

  void updateProductModelType(String modelType) {
    _modelType = modelType ?? "";
    notifyListeners();
  }

  void updateProductStatus(String productStatus) {
    _productStatus = productStatus ?? "";
    notifyListeners();
  }

  void updateProductDeviceId(String deviceId) {
    _deviceId = deviceId ?? "";
    notifyListeners();
  }

  void updateProductDescription(String description) {
    _description = description ?? "";
    notifyListeners();
  }

  void updateProductWarranty(String warranty) {
    _warranty = warranty ?? "";
    notifyListeners();
  }

  void updateProductCurrentDate(DateTime currentDate) {
    _currentDate = currentDate;
    notifyListeners();
  }

  // Save the product data (you can implement your logic here)
  void saveProduct() {
    // Implement your logic for saving the product
    // For example, you can send the data to a database or API
    // Here, we'll just print the product data as an example
    print('Product Data:');
    print('Category: $_category');
    print('Model Type: $_modelType');
    print('Product Status: $_productStatus');
    print('Device ID: $_deviceId');
    print('Description: $_description');
    print('Warranty: $_warranty');
    print('Current Date: $_currentDate');
  }
}
