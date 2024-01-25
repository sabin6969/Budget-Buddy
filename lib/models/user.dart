class User {
  String? memberSince;
  String? displayName;
  String? description;
  String? profileImageUrl;

  User(
      {this.memberSince,
      this.displayName,
      this.description,
      this.profileImageUrl});

  User.fromJson(Map<String, dynamic> json) {
    memberSince = json["memberSince"];
    displayName = json["displayName"];
    description = json["description"];
    profileImageUrl = json["profileImageURL"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["memberSince"] = memberSince;
    data["displayName"] = displayName;
    data["description"] = description;
    data["profileImageURL"] = profileImageUrl;
    return data;
  }
}
