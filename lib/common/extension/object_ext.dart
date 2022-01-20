extension ObjectExtension on dynamic {
  bool _isNotNull() {
    return this != null;
  }

  bool _isNull() {
    return this == null;
  }

  bool _isNotNullBlank() {
    if (this != null) {
      if (this is String) {
        return this.toString().trim().isNotEmpty;
      }
      return false;
    }

    return false;
  }

  get isNotNull => _isNotNull();

  get isNulled => _isNull();

  get isNotNullBlank => _isNotNullBlank();
}
