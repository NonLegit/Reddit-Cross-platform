class PostModel {
  String? sId;
  String? ownerType;
  List<dynamic>? replies;
  String? title;
  String? kind;
  String? text;
  List<dynamic>? images;
  String? createdAt;
  bool? locked;
  bool? isDeleted;
  bool? sendReplies;
  bool? nsfw;
  bool? spoiler;
  int? votes;
  int? views;
  int? commentCount;
  int? shareCount;
  String? suggestedSort;
  bool? scheduled;
  FlairId? flairId;
  bool? isHidden;
  bool? isSaved;
  Owner? owner;
  Author? author;
  String? postVoteStatus;
  bool? isSpam;
  String? url;

  PostModel(
      {this.sId,
      this.ownerType,
      this.replies,
      this.title,
      this.kind,
      this.text,
      this.images,
      this.createdAt,
      this.locked,
      this.isDeleted,
      this.sendReplies,
      this.nsfw,
      this.spoiler,
      this.votes,
      this.views,
      this.commentCount,
      this.shareCount,
      this.suggestedSort,
      this.scheduled,
      this.flairId,
      this.isHidden,
      this.isSaved,
      this.owner,
      this.author,
      this.postVoteStatus,
      this.isSpam,
      this.url});

  PostModel.fromJson(Map<String, dynamic> json) {
    print(json['_id'].runtimeType);
    print(json['ownerType'].runtimeType);
    print(json['replies'].runtimeType);
    print(json['title'].runtimeType);
    print(json['kind'].runtimeType);
    print(json['text'].runtimeType);
    print(json['images'].runtimeType);
    print(json['createdAt'].runtimeType);
    print(json['locked'].runtimeType);
    print(json['isDeleted'].runtimeType);
    print(json['sendReplies'].runtimeType);
    print(json['nsfw'].runtimeType);
    print(json['spoiler'].runtimeType);
    print(json['votes'].runtimeType);
    print(json['views'].runtimeType);
    print(json['commentCount'].runtimeType);
    print(json['shareCount'].runtimeType);
    print(json['suggestedSort'].runtimeType);
    print(json['scheduled'].runtimeType);
    print(json['flairId'].runtimeType);
    print(json['isHidden'].runtimeType);
    print(json['isSaved'].runtimeType);
    print(json['owner'].runtimeType);
    print(json['author'].runtimeType);
    print(json['postVoteStatus'].runtimeType);
    print(json['isSpam'].runtimeType);
    print(json['url'].runtimeType);

    sId = json['_id'];
    ownerType = json['ownerType'];
    replies = json['replies'];
    title = json['title'];
    kind = json['kind'];
    text = json['text'];
    images = json['images'];
    createdAt = json['createdAt'];
    locked = json['locked'];
    isDeleted = json['isDeleted'];
    sendReplies = json['sendReplies'];
    nsfw = json['nsfw'];
    spoiler = json['spoiler'];
    votes = json['votes'];
    views = json['views'];
    commentCount = json['commentCount'];
    shareCount = json['shareCount'];
    suggestedSort = json['suggestedSort'];
    scheduled = json['scheduled'];
    flairId =
        json['flairId'] != null ? new FlairId.fromJson(json['flairId']) : null;
    isHidden = json['isHidden'];
    isSaved = json['isSaved'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    postVoteStatus = json['postVoteStatus'];
    isSpam = json['isSpam'];
    url = (json['url'] != null) ? json['url'] : '';
  }
}

class FlairId {
  String? sId;
  String? text;
  String? backgroundColor;
  String? textColor;
  String? permission;

  FlairId(
      {this.sId,
      this.text,
      this.backgroundColor,
      this.textColor,
      this.permission});

  FlairId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
    permission = json['permission'];
  }
}

class Owner {
  String? sId;
  String? name;
  String? icon;

  Owner({this.sId, this.name, this.icon});

  Owner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    icon = json['icon'];
  }
}

class Author {
  String? sId;
  String? name;
  String? icon;

  Author({this.sId, this.name, this.icon});

  Author.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    icon = json['icon'];
  }
}
