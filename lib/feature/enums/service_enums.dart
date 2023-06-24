enum ServicePathes {
  // Get Products
  products,
  // Get Product By Id,
  product,
}

extension ServicePathesExtension on ServicePathes {
  String get rawValue {
    switch (this) {
      case ServicePathes.products:
        return '/products';
      case ServicePathes.product:
        return '/product';
      default:
        return '';
    }
  }
}
