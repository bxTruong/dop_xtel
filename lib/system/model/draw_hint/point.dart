class Point {
  Point({
    this.x,
    this.y,
  });

  Point.fromJson(dynamic json) {
    x = json['x'].toDouble();
    y = json['y'].toDouble();
  }

  double? x;
  double? y;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['x'] = x;
    map['y'] = y;
    return map;
  }
}
