enum Unit {
  g,
  ml,
  piece,
  can,
  glass,
}

extension ParseToString on Unit {
  //TODO @Jens: What happens here?
  String toDisplayString() {
    return this.toString().split('.').last;
  }
}
