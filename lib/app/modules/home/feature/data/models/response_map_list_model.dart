import 'map_model.dart';

class ResponseMapListModel {
  ResponseMapListModel({
    this.status,
    this.data,
  });

  int? status;
  List<MapModel>? data;

  ResponseMapListModel copyWith({
    int? status,
    List<MapModel>? data,
  }) =>
      ResponseMapListModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory ResponseMapListModel.fromMap(Map<String, dynamic> json) =>
      ResponseMapListModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<MapModel>.from(
                json["data"]!.map((x) => MapModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}
