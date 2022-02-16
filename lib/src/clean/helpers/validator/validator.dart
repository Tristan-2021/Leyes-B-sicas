String? validatenombre(String? value) {
  const String pattern = r'^[a-z A-Z]+$';
  final RegExp regex = RegExp(pattern);
  if (value != null) {
    if (regex.hasMatch(value) && value.length >= 3 && value.length <= 25) {
      return null;
    } else {
      return "nombre incorrecto, no usar tíldes";
    }
  }
}
