class MapLocation {
  MapLocation({
    this.x,
    this.y,
  });

  double? x;
  double? y;

  MapLocation copyWith({
    double? x,
    double? y,
  }) =>
      MapLocation(
        x: x ?? this.x,
        y: y ?? this.y,
      );

  factory MapLocation.fromMap(Map<String, dynamic> json) => MapLocation(
        x: json['x']?.toDouble(),
        y: json['y']?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'x': x,
        'y': y,
      };
}
