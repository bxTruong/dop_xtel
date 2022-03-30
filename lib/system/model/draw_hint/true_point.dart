import 'point.dart';

class TruePoint {
  TruePoint({
    this.point,
  });

  TruePoint.fromJson(dynamic json) {
    if (json['point'] != null) {
      point = [];
      json['point'].forEach((v) {
        point?.add(Point.fromJson(v));
      });
    }
  }

  List<Point>? point;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (point != null) {
      map['point'] = point?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
