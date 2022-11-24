class NotificationsClassModel {
  String? type;
  String? folowerId;
  String? postId;
  String? commentId;
  String? followedId;
  String? createdAt;
  bool? seen;
  bool? isHidden;

  NotificationsClassModel(
      {this.type,
      this.folowerId,
      this.postId,
      this.commentId,
      this.followedId,
      this.createdAt,
      this.seen,
      this.isHidden});

  NotificationsClassModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    folowerId = json['folowerId'];
    postId = json['postId'];
    commentId = json['commentId'];
    followedId = json['followedId'];
    createdAt = json['createdAt'];
    seen = json['seen'];
    isHidden = json['isHidden'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['folowerId'] = folowerId;
    data['postId'] = postId;
    data['commentId'] = commentId;
    data['followedId'] = followedId;
    data['createdAt'] = createdAt;
    data['seen'] = seen;
    data['isHidden'] = isHidden;
    return data;
  }
}