enum SuperRegionName { A, ATTACKER_SIDE, B, MID, DEFENDER_SIDE, C }

final superRegionNameValues = EnumValues({
  'A': SuperRegionName.A,
  'Attacker Side': SuperRegionName.ATTACKER_SIDE,
  'B': SuperRegionName.B,
  'C': SuperRegionName.C,
  'Defender Side': SuperRegionName.DEFENDER_SIDE,
  'Mid': SuperRegionName.MID
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
