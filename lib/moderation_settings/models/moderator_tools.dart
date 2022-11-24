class ModeratorToolsModel {
  String? createdAt;
  String? primaryTopic;
  String? backgroundImage;
  String? icon;
  Rules? rules;
  String? name;
  String? description;
  List<Null>? topics;
  String? language;
  String? region;
  String? type;
  bool? nsfw;
  String? postType;
  bool? allowCrossposting;
  bool? allowArchivePosts;
  bool? allowSpoilerTag;
  bool? allowGif;
  bool? allowImageUploads;
  bool? allowMultipleImage;

  ModeratorToolsModel(
      {this.createdAt,
      this.primaryTopic,
      this.backgroundImage,
      this.icon,
      this.rules,
      this.name,
      this.description,
      this.topics,
      this.language,
      this.region,
      this.type,
      this.nsfw,
      this.postType,
      this.allowCrossposting,
      this.allowArchivePosts,
      this.allowSpoilerTag,
      this.allowGif,
      this.allowImageUploads,
      this.allowMultipleImage});

    String? get choosenTopic1{
        return primaryTopic;
      }    

  ModeratorToolsModel.fromJson(Map<String, dynamic> json) {
    //createdAt = json['createdAt'];
    primaryTopic = json['primaryTopic'];
    // backgroundImage = json['backgroundImage'];
    // icon = json['icon'];
    // rules = json['rules'] != null ? Rules.fromJson(json['rules']) : null;
    // name = json['name'];
    // description = json['description'];
    // if (json['topics'] != null) {
    //   topics = <Null>[];
    //   json['topics'].forEach((v) {
    //     topics!.add(new Null.fromJson(v));
    //   });
    // }
    // language = json['language'];
    // region = json['region'];
    // type = json['type'];
    // nsfw = json['nsfw'];
    // postType = json['postType'];
    // allowCrossposting = json['allowCrossposting'];
    // allowArchivePosts = json['allowArchivePosts'];
    // allowSpoilerTag = json['allowSpoilerTag'];
    // allowGif = json['allowGif'];
    // allowImageUploads = json['allowImageUploads'];
    // allowMultipleImage = json['allowMultipleImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['primaryTopic'] = primaryTopic;
    data['backgroundImage'] = backgroundImage;
    data['icon'] = icon;
    if (rules != null) {
      data['rules'] = rules!.toJson();
    }
    data['name'] = name;
    data['description'] = description;
    // if (this.topics != null) {
    //   data['topics'] = topics!.map((v) => v.toJson()).toList();
    // }
    data['language'] = language;
    data['region'] = region;
    data['type'] = type;
    data['nsfw'] = nsfw;
    data['postType'] = postType;
    data['allowCrossposting'] = allowCrossposting;
    data['allowArchivePosts'] = allowArchivePosts;
    data['allowSpoilerTag'] = allowSpoilerTag;
    data['allowGif'] = allowGif;
    data['allowImageUploads'] = allowImageUploads;
    data['allowMultipleImage'] = allowMultipleImage;
    return data;
  }
}

class Rules {
  String? title;
  String? description;
  String? defaultName;
  String? appliesTo;

  Rules({this.title, this.description, this.defaultName, this.appliesTo});

  Rules.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    defaultName = json['defaultName'];
    appliesTo = json['appliesTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['defaultName'] = defaultName;
    data['appliesTo'] = appliesTo;
    return data;
  }
}