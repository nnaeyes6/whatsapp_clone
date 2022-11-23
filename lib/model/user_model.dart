import 'package:meta/meta.dart';

@immutable
class UserModel {
  const UserModel({
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.isOnline,
    required this.phoneNumber,
    required this.groupId,
  });

  final String name;
  final String profilePic;
  final String uid;
  final bool isOnline;
  final String phoneNumber;
  final List<String> groupId;

  static const none = UserModel(
    name: '',
    profilePic: '',
    uid: '',
    isOnline: false,
    phoneNumber: '',
    groupId: [],
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'uid': uid,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      uid: map['uid'] as String,
      isOnline: map['isOnline'] as bool,
      phoneNumber: map['phoneNumber'] as String,
      groupId: List<String>.from(
        (map['groupId'] as List<String>),
      ),
    );
  }
}
