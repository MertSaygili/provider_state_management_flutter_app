class CustomServiceException implements Exception {
  final String message;
  final int statusCode;

  CustomServiceException({required this.message, required this.statusCode});

  @override
  String toString() {
    return message;
  }
}

class CustomServiceExtensionTexts {
  static const String somethingWentWrongListModel = 'Something went wrong, while fetching product list model from network!';
  static const String somethingWentWrongModel = 'Something went wrong, while fetching product model from network!';
}
