class Game {
  late int id;
  late String nameLevel;
  late bool isPlayed;
  late String imageFail;
  late String imageSuccess;
  late String jsonHint;
  // 0,1,2
  late int difficultyLevel;

  Game(
      {int? id,
      String? nameLevel,
      bool? isPlayed,
      String? imageFail,
      String? imageSuccess,
      String? jsonHint,
      int? difficultyLevel}) {
    this.id = id ?? -1;
    this.nameLevel = nameLevel ?? '';
    this.isPlayed = isPlayed ?? false;
    this.imageFail = imageFail ?? '';
    this.imageSuccess = imageSuccess ?? '';
    this.jsonHint = jsonHint ?? '';
    this.difficultyLevel = difficultyLevel ?? -1;
  }

  Game.fromJson(dynamic json) {
    id = json['id'];
    nameLevel = json['nameLevel'];
    isPlayed = json['isPlayed'];
    imageFail = json['imageFail'];
    imageSuccess = json['imageSuccess'];
    jsonHint = json['jsonHint'];
    difficultyLevel = json['difficultyLevel'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nameLevel'] = nameLevel;
    map['isPlayed'] = isPlayed;
    map['imageFail'] = imageFail;
    map['imageSuccess'] = imageSuccess;
    map['jsonHint'] = jsonHint;
    map['difficultyLevel'] = difficultyLevel;
    return map;
  }
}
