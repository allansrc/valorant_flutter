class AgentsResponse {
  AgentsResponse({
    this.status,
    this.data,
  });

  int? status;
  List<Agent?>? data;

  factory AgentsResponse.fromJson(Map<String, dynamic> json) => AgentsResponse(
        status: json['status'],
        data: json['data'] == null
            ? []
            : List<Agent?>.from(json['data']!.map((x) => Agent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class Agent {
  Agent({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.abilities,
    this.voiceLine,
  });

  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  List<String?>? characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String?>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  List<Ability?>? abilities;
  VoiceLine? voiceLine;

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        uuid: json['uuid'],
        displayName: json['displayName'],
        description: json['description'],
        developerName: json['developerName'],
        characterTags: json['characterTags'] == null
            ? []
            : json['characterTags'] == null
                ? []
                : List<String?>.from(json['characterTags']!.map((x) => x)),
        displayIcon: json['displayIcon'],
        displayIconSmall: json['displayIconSmall'],
        bustPortrait: json['bustPortrait'],
        fullPortrait: json['fullPortrait'],
        fullPortraitV2: json['fullPortraitV2'],
        killfeedPortrait: json['killfeedPortrait'],
        background: json['background'],
        backgroundGradientColors: json['backgroundGradientColors'] == null
            ? []
            : List<String?>.from(
                json['backgroundGradientColors']!.map((x) => x)),
        assetPath: json['assetPath'],
        isFullPortraitRightFacing: json['isFullPortraitRightFacing'],
        isPlayableCharacter: json['isPlayableCharacter'],
        isAvailableForTest: json['isAvailableForTest'],
        isBaseContent: json['isBaseContent'],
        role: json['role'] == null ? null : Role.fromJson(json['role']),
        abilities: json['abilities'] == null
            ? []
            : List<Ability?>.from(
                json['abilities']!.map((x) => Ability.fromJson(x))),
        voiceLine: VoiceLine.fromJson(json['voiceLine']),
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'displayName': displayName,
        'description': description,
        'developerName': developerName,
        'characterTags': characterTags == null
            ? []
            : characterTags == null
                ? []
                : List<dynamic>.from(characterTags!.map((x) => x)),
        'displayIcon': displayIcon,
        'displayIconSmall': displayIconSmall,
        'bustPortrait': bustPortrait,
        'fullPortrait': fullPortrait,
        'fullPortraitV2': fullPortraitV2,
        'killfeedPortrait': killfeedPortrait,
        'background': background,
        'backgroundGradientColors': backgroundGradientColors == null
            ? []
            : List<dynamic>.from(backgroundGradientColors!.map((x) => x)),
        'assetPath': assetPath,
        'isFullPortraitRightFacing': isFullPortraitRightFacing,
        'isPlayableCharacter': isPlayableCharacter,
        'isAvailableForTest': isAvailableForTest,
        'isBaseContent': isBaseContent,
        'role': role,
        'abilities': abilities == null
            ? []
            : List<dynamic>.from(abilities!.map((x) => x!.toJson())),
        'voiceLine': voiceLine!.toJson(),
      };
}

class Ability {
  Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  Slot? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: slotValues.map[json['slot']],
        displayName: json['displayName'],
        description: json['description'],
        displayIcon: json['displayIcon'],
      );

  Map<String, dynamic> toJson() => {
        'slot': slotValues.reverse![slot],
        'displayName': displayName,
        'description': description,
        'displayIcon': displayIcon,
      };
}

enum Slot { ABILITY1, ABILITY2, GRENADE, ULTIMATE, PASSIVE }

final slotValues = EnumValues({
  'Ability1': Slot.ABILITY1,
  'Ability2': Slot.ABILITY2,
  'Grenade': Slot.GRENADE,
  'Passive': Slot.PASSIVE,
  'Ultimate': Slot.ULTIMATE
});

class Role {
  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  String? uuid;
  DisplayName? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        uuid: json['uuid'],
        displayName: displayNameValues.map[json['displayName']],
        description: json['description'],
        displayIcon: json['displayIcon'],
        assetPath: json['assetPath'],
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'displayName': displayNameValues.reverse![displayName],
        'description': description,
        'displayIcon': displayIcon,
        'assetPath': assetPath,
      };
}

enum DisplayName { INITIATOR, DUELIST, SENTINEL, CONTROLLER }

final displayNameValues = EnumValues({
  'Controller': DisplayName.CONTROLLER,
  'Duelist': DisplayName.DUELIST,
  'Initiator': DisplayName.INITIATOR,
  'Sentinel': DisplayName.SENTINEL
});

class VoiceLine {
  VoiceLine({
    this.minDuration,
    this.maxDuration,
    this.mediaList,
  });

  double? minDuration;
  double? maxDuration;
  List<MediaList?>? mediaList;

  factory VoiceLine.fromJson(Map<String, dynamic> json) => VoiceLine(
        minDuration: json['minDuration'].toDouble(),
        maxDuration: json['maxDuration'].toDouble(),
        mediaList: json['mediaList'] == null
            ? []
            : List<MediaList?>.from(
                json['mediaList']!.map((x) => MediaList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'minDuration': minDuration,
        'maxDuration': maxDuration,
        'mediaList': mediaList == null
            ? []
            : List<dynamic>.from(mediaList!.map((x) => x!.toJson())),
      };
}

class MediaList {
  MediaList({
    this.id,
    this.wwise,
    this.wave,
  });

  int? id;
  String? wwise;
  String? wave;

  factory MediaList.fromJson(Map<String, dynamic> json) => MediaList(
        id: json['id'],
        wwise: json['wwise'],
        wave: json['wave'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'wwise': wwise,
        'wave': wave,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
