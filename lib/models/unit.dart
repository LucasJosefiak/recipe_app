enum Unit {
  g,
  ml,
  piece,
  can,
  glass,
}

extension ParseToString on Unit {
  //TODO what does that line of code mean?
  String toDisplayString() {
    return this.toString().split('.').last;
  }
}
