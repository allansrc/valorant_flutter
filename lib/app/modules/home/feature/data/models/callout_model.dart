import 'map_location_model.dart';
import 'maps_enums.dart';

class Callout {
  Callout({
    this.regionName,
    this.superRegionName,
    this.location,
  });

  String? regionName;
  SuperRegionName? superRegionName;
  MapLocation? location;

  Callout copyWith({
    String? regionName,
    SuperRegionName? superRegionName,
    MapLocation? location,
  }) =>
      Callout(
        regionName: regionName ?? this.regionName,
        superRegionName: superRegionName ?? this.superRegionName,
        location: location ?? this.location,
      );

  factory Callout.fromMap(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: superRegionNameValues.map[json["superRegionName"]]!,
        location: json["location"] == null
            ? null
            : MapLocation.fromMap(json["location"]),
      );

  Map<String, dynamic> toMap() => {
        "regionName": regionName,
        "superRegionName": superRegionNameValues.reverse[superRegionName],
        "location": location?.toMap(),
      };
}
