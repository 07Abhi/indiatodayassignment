import 'package:assignment/app_utils/app_enums.dart';

class AgentModel {
  AgentModel({
    this.id,
    this.urlSlug,
    this.namePrefix,
    this.firstName,
    this.lastName,
    this.aboutMe,
    this.profliePicUrl,
    this.experience,
    this.languages,
    this.minimumCallDuration,
    this.minimumCallDurationCharges,
    this.additionalPerMinuteCharges,
    this.isAvailable,
    this.rating,
    this.skills,
    this.isOnCall,
    this.freeMinutes,
    this.additionalMinute,
    this.images,
    this.availability,
    this.tag,
  });

  int id;
  String urlSlug;
  String namePrefix;
  String firstName;
  String lastName;
  String aboutMe;
  String profliePicUrl;
  double experience;
  List<Language> languages;
  double minimumCallDuration;
  double minimumCallDurationCharges;
  double additionalPerMinuteCharges;
  bool isAvailable;
  double rating;
  List<Skill> skills;
  bool isOnCall;
  int freeMinutes;
  int additionalMinute;
  Images images;
  Availability availability;
  SortingTag tag;

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        id: json["id"] ?? 0,
        urlSlug: json["urlSlug"] ?? "",
        namePrefix: json["namePrefix"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        aboutMe: json["aboutMe"] ?? "",
        profliePicUrl: json["profliePicUrl"] ?? "",
        experience: json["experience"] ?? 0.0,
        languages: json["languages"] == null
            ? []
            : List<Language>.from(
                json["languages"].map((x) => Language.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"]?.toDouble(),
        minimumCallDurationCharges:
            json["minimumCallDurationCharges"]?.toDouble(),
        additionalPerMinuteCharges:
            json["additionalPerMinuteCharges"]?.toDouble(),
        isAvailable: json["isAvailable"],
        rating: json["rating"]?.toDouble(),
        skills: json["skills"] == null
            ? []
            : List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        isOnCall: json["isOnCall"],
        freeMinutes: json["freeMinutes"],
        additionalMinute: json["additionalMinute"],
        images: Images.fromJson(json["images"]),
        availability: json["availability"] == null
            ? Availability()
            : Availability.fromJson(json["availability"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix,
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe,
        "profliePicUrl": profliePicUrl,
        "experience": experience,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "rating": rating,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images.toJson(),
        "availability": availability.toJson(),
      };
}

class Availability {
  Availability({
    this.days,
    this.slot,
  });

  List<String> days;
  Slot slot;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        days: json["days"] == null
            ? []
            : List<String>.from(json["days"].map((x) => x)),
        slot: json["slot"] == null ? Slot() : Slot.fromJson(json["slot"]),
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x)),
        "slot": slot.toJson(),
      };
}

class Slot {
  Slot({
    this.toFormat,
    this.fromFormat,
    this.from,
    this.to,
  });

  String toFormat;
  String fromFormat;
  String from;
  String to;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        toFormat: json["toFormat"] ?? "",
        fromFormat: json["fromFormat"] ?? "",
        from: json["from"] ?? "",
        to: json["to"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "toFormat": toFormat,
        "fromFormat": fromFormat,
        "from": from,
        "to": to,
      };
}

class Images {
  Images({
    this.small,
    this.large,
    this.medium,
  });

  Large small;
  Large large;
  Large medium;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: json["small"] == null ? Large() : Large.fromJson(json["small"]),
        large: json["large"] == null ? Large() : Large.fromJson(json["large"]),
        medium:
            json["medium"] == null ? Large() : Large.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small.toJson(),
        "large": large.toJson(),
        "medium": medium.toJson(),
      };
}

class Large {
  Large({
    this.imageUrl,
    this.id,
  });

  String imageUrl;
  int id;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"] ?? "",
        id: json["id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl ?? "",
        "id": id ?? 0,
      };
}

class Language {
  Language({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Skill {
  Skill({
    this.id,
    this.name,
    this.description,
  });

  int id;
  String name;
  String description;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
