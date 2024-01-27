class UserModel {
  String? memberSince;
  String? displayName;
  String? description;
  String? profileImageUrl;
  String? uid;

  UserModel({
    this.memberSince,
    this.displayName,
    this.description,
    this.profileImageUrl,
    this.uid,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    memberSince = json["memberSince"];
    displayName = json["displayName"];
    description = json["description"];
    profileImageUrl = json["profileImageURL"];
    uid = json["uid"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["memberSince"] = memberSince;
    data["displayName"] = displayName;
    data["description"] = description;
    data["profileImageURL"] = profileImageUrl;
    data["uid"] = uid;
    return data;
  }
}
