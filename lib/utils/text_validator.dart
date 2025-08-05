class TextValidator {
  final String fieldName;
  final RegExp textValid = RegExp(r"^\s*[a-zA-Z,\s]+\s*$");

  TextValidator({this.fieldName = 'Field'});

  String? call(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    if (value.length < 3) {
      return '$fieldName must be at least 3 characters';
    }

    return null; // valid
  }
}
