class PlaceModel {
  PlaceModel({
    this.placeName,
    this.placeId,
  });

  String placeName;
  String placeId;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}
