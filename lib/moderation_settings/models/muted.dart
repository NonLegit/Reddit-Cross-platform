class Muted {
  String? sId;
  String? userName;
  String? profilePicture;
  String? joiningDate;
  MuteInfo? muteInfo;

  Muted(
      {this.sId,
      this.userName,
      this.profilePicture,
      this.joiningDate,
      this.muteInfo});

  Muted.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    profilePicture = json['profilePicture'];
    joiningDate = json['joiningDate'];
    muteInfo = json['muteInfo'] != null
        ? new MuteInfo.fromJson(json['muteInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['profilePicture'] = this.profilePicture;
    data['joiningDate'] = this.joiningDate;
    if (this.muteInfo != null) {
      data['muteInfo'] = this.muteInfo!.toJson();
    }
    return data;
  }
}

class MuteInfo {
  String? muteMessage;

  MuteInfo({this.muteMessage});

  MuteInfo.fromJson(Map<String, dynamic> json) {
    muteMessage = json['muteMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['muteMessage'] = this.muteMessage;
    return data;
  }
}
