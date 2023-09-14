class ProductModel {
  final String category;
  final String modelType;
  final String productStatus;
  final String deviceId;
  final String description;
  final String warranty;
  final DateTime currentDate;

  ProductModel({
    required this.category,
    required this.modelType,
    required this.productStatus,
    required this.deviceId,
    required this.description,
    required this.warranty,
    required this.currentDate,
  });
}
