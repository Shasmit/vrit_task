class LinkData {
  String? id;
  String? title;
  String? slashtag;
  String? destination;
  String? createdAt;
  String? updatedAt;
  dynamic expiredAt;
  String? status;
  List<dynamic>? tags;
  String? linkType;
  int? clicks;
  bool? isPublic;
  String? shortUrl;
  String? domainId;
  String? domainName;
  DomainData? domain;
  bool? https;
  bool? favourite;
  CreatorData? creator;
  bool? integrated;

  LinkData({
    this.id,
    this.title,
    this.slashtag,
    this.destination,
    this.createdAt,
    this.updatedAt,
    this.expiredAt,
    this.status,
    this.tags,
    this.linkType,
    this.clicks,
    this.isPublic,
    this.shortUrl,
    this.domainId,
    this.domainName,
    this.domain,
    this.https,
    this.favourite,
    this.creator,
    this.integrated,
  });

  LinkData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        slashtag = json['slashtag'],
        destination = json['destination'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        expiredAt = json['expiredAt'],
        status = json['status'],
        tags = json['tags'],
        linkType = json['linkType'],
        clicks = json['clicks'],
        isPublic = json['isPublic'],
        shortUrl = json['shortUrl'],
        domainId = json['domainId'],
        domainName = json['domainName'],
        domain =
            json['domain'] != null ? DomainData.fromJson(json['domain']) : null,
        https = json['https'],
        favourite = json['favourite'],
        creator = json['creator'] != null
            ? CreatorData.fromJson(json['creator'])
            : null,
        integrated = json['integrated'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'slashtag': slashtag,
        'destination': destination,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'expiredAt': expiredAt,
        'status': status,
        'tags': tags,
        'linkType': linkType,
        'clicks': clicks,
        'isPublic': isPublic,
        'shortUrl': shortUrl,
        'domainId': domainId,
        'domainName': domainName,
        'domain': domain?.toJson(),
        'https': https,
        'favourite': favourite,
        'creator': creator?.toJson(),
        'integrated': integrated,
      };
}

class DomainData {
  String? id;
  String? ref;
  String? fullName;
  SharingData? sharing;
  bool? active;

  DomainData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        ref = json['ref'],
        fullName = json['fullName'],
        sharing = json['sharing'] != null
            ? SharingData.fromJson(json['sharing'])
            : null,
        active = json['active'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'ref': ref,
        'fullName': fullName,
        'sharing': sharing?.toJson(),
        'active': active,
      };
}

class SharingData {
  ProtocolData? protocol;

  SharingData.fromJson(Map<String, dynamic> json)
      : protocol = json['protocol'] != null
            ? ProtocolData.fromJson(json['protocol'])
            : null;

  Map<String, dynamic> toJson() => {
        'protocol': protocol?.toJson(),
      };
}

class ProtocolData {
  List<String>? allowed;
  String? defaultProtocol;

  ProtocolData.fromJson(Map<String, dynamic> json)
      : allowed =
            json['allowed'] != null ? List<String>.from(json['allowed']) : null,
        defaultProtocol = json['default'];

  Map<String, dynamic> toJson() => {
        'allowed': allowed,
        'default': defaultProtocol,
      };
}

class CreatorData {
  String? id;
  String? fullName;
  String? avatarUrl;

  CreatorData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        avatarUrl = json['avatarUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'avatarUrl': avatarUrl,
      };
}
