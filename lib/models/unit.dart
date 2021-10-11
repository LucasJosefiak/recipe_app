enum Unit {
  g,
  ml,
  piece,
  can,
  glass,
}

extension ParseToString on Unit {
  String toDisplayString() {
    return this.toString().split('.').last;
  }
}
