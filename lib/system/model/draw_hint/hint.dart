import 'true_point.dart';

class Hint {
  Hint({
    this.truePoint,
  });

  Hint.fromJson(dynamic json) {
    if (json['truePoint'] != null) {
      truePoint = [];
      json['truePoint'].forEach((v) {
        truePoint?.add(TruePoint.fromJson(v));
      });
    }
  }

  List<TruePoint>? truePoint;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (truePoint != null) {
      map['truePoint'] = truePoint?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
