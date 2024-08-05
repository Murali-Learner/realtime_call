class Contact {
  bool joined;
  String name;
  String uid;
  String? whoIsCalling;

  Contact({
    this.joined = false,
    required this.name,
    required this.uid,
    this.whoIsCalling,
  });

  // fromJson method
  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      joined: json['joined'] ?? false,
      name: json['name'] ?? '',
      uid: json['UID'] ?? '',
      whoIsCalling: json['whoIsCalling'] ?? "",
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'joined': joined,
      'name': name,
      'UID': uid,
      'whoIsCalling': whoIsCalling,
    };
  }

  // copyWith method
  Contact copyWith({
    bool? joined,
    String? name,
    String? uid,
    String? whoIsCalling,
  }) {
    return Contact(
      joined: joined ?? this.joined,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      whoIsCalling: whoIsCalling ?? this.whoIsCalling,
    );
  }
}
