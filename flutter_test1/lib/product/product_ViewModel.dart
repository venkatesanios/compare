import 'package:flutter/material.dart';
import 'package:flutter_test1/product/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  // Define the properties for the product
  String? _category;
  String? _modelType;
  String? _productStatus;
  String? _deviceId;
  String? _description;
  String? _warranty;
  DateTime? _currentDate;
  final product = ProductModel(category: 'Model 1', modelType: 'modelType', productStatus: 'admin', deviceId: 'deviceId', description: 'description', warranty: 'warranty', currentDate: DateTime.now());
  // Getters for the properties
  String get category => _category ?? product.category;
  String get modelType => _modelType ?? product.modelType;
  String get productStatus => _productStatus ?? product.productStatus;
  String get deviceId => _deviceId ?? product.deviceId;
  String get description => _description ?? product.description;
  String get warranty => _warranty ?? product.warranty;
  DateTime get currentDate => _currentDate ?? product.currentDate;

  // Update methods for the properties
  void updateProductCategory(String category) {
    _category = category;
    notifyListeners();
  }

  void updateProductModelType(String modelType) {
    _modelType = modelType;
    notifyListeners();
  }

  void updateProductStatus(String productStatus) {
    _productStatus = productStatus;
    notifyListeners();
  }

  void updateProductDeviceId(String deviceId) {
    _deviceId = deviceId;
    notifyListeners();
  }

  void updateProductDescription(String description) {
    _description = description;
    notifyListeners();
  }

  void updateProductWarranty(String warranty) {
    _warranty = warranty;
    notifyListeners();
  }

  void updateProductCurrentDate(DateTime currentDate) {
    _currentDate = currentDate;
    notifyListeners();
  }

  // Save the product data (you can implement your logic here)
  void saveProduct() {
    print('Add Product Data');
    print('Category: $_category');
    print('Model Type: $_modelType');
    print('Product Status: $_productStatus');
    print('Device ID: $_deviceId');
    print('Description: $_description');
    print('Warranty: $_warranty');
    print('Current Date: $_currentDate');
  }
}
