import 'callout_model.dart';

class MapModel {
  MapModel({
    this.uuid,
    this.displayName,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.splash,
    this.assetPath,
    this.mapUrl,
    this.xMultiplier,
    this.yMultiplier,
    this.xScalarToAdd,
    this.yScalarToAdd,
    this.callouts,
  });

  String? uuid;
  String? displayName;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;
  double? xMultiplier;
  double? yMultiplier;
  double? xScalarToAdd;
  double? yScalarToAdd;
  List<Callout>? callouts;

  MapModel copyWith({
    String? uuid,
    String? displayName,
    String? coordinates,
    String? displayIcon,
    String? listViewIcon,
    String? splash,
    String? assetPath,
    String? mapUrl,
    double? xMultiplier,
    double? yMultiplier,
    double? xScalarToAdd,
    double? yScalarToAdd,
    List<Callout>? callouts,
  }) =>
      MapModel(
        uuid: uuid ?? this.uuid,
        displayName: displayName ?? this.displayName,
        coordinates: coordinates ?? this.coordinates,
        displayIcon: displayIcon ?? this.displayIcon,
        listViewIcon: listViewIcon ?? this.listViewIcon,
        splash: splash ?? this.splash,
        assetPath: assetPath ?? this.assetPath,
        mapUrl: mapUrl ?? this.mapUrl,
        xMultiplier: xMultiplier ?? this.xMultiplier,
        yMultiplier: yMultiplier ?? this.yMultiplier,
        xScalarToAdd: xScalarToAdd ?? this.xScalarToAdd,
        yScalarToAdd: yScalarToAdd ?? this.yScalarToAdd,
        callouts: callouts ?? this.callouts,
      );

  factory MapModel.fromMap(Map<String, dynamic> json) => MapModel(
        uuid: json["uuid"],
        displayName: json["displayName"],
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        splash: json["splash"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"]?.toDouble(),
        yMultiplier: json["yMultiplier"]?.toDouble(),
        xScalarToAdd: json["xScalarToAdd"]?.toDouble(),
        yScalarToAdd: json["yScalarToAdd"]?.toDouble(),
        callouts: json["callouts"] == null
            ? []
            : List<Callout>.from(
                json["callouts"]!.map((x) => Callout.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "uuid": uuid,
        "displayName": displayName,
        "coordinates": coordinates,
        "displayIcon": displayIcon,
        "listViewIcon": listViewIcon,
        "splash": splash,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": callouts == null
            ? []
            : List<dynamic>.from(callouts!.map((x) => x.toMap())),
      };
}
