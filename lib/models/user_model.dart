import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  String name;
  String email;
  DateTime date_created;
  String id;
  DateTime? date_updated;
  String? bio;
  String avatar_url;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    this.bio,
    this.avatar_url = "https://firebasestorage.googleapis.com/v0/b/doggo-save.appspot.com/o/profile.png?alt=media&token=589fbd2f-e39b-485d-87d6-92eb5ac3f7cc",
    required this.date_created,
    this.date_updated,
  });
  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        name: json['name'],
        id: json['id'],
        email: json['email'],
        date_created: ConvertDate.fromTimeStamp(json['date_created']).dateTime,
        bio: json['bio'],
        avatar_url: json['avatar_url'],
        date_updated: ConvertDate.fromTimeStamp(json['date_updated']).dateTime
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'id': id,
      'bio': bio,
      'email': email,
      'date_created': ConvertDate(dateTime: date_created).toTimeStamp(),
      'date_updated': date_updated == null ? null : ConvertDate(dateTime: date_updated!).toTimeStamp(),
      'avatar_url': avatar_url
    };
  }

  UserModel copyWith({
  String? email,
    String? bio,
    String? name,
    String? avatar_url,
    String? id,
    DateTime? date_created,
    DateTime? date_updated

}){
    return UserModel(
      email: email ?? this.email,
      id: id ?? this.id,
      date_created: date_created ?? this.date_created,
      date_updated: date_updated ?? this.date_updated,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      avatar_url: avatar_url ?? this.avatar_url,
    );
  }

  @override
  String toString(){
    return
      'UserModel(name: $name, id: $id, email: $email, avatar_url: $avatar_url, date_created: $date_created, date_updated: $date_updated, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;

    return other is UserModel &&
    other.id == id &&
    other.name == name &&
    other.email == email &&
    other.avatar_url == avatar_url &&
    other.date_created == date_created &&
    other.date_updated == date_updated;
  }

  @override
  int get hashCode {
   return id.hashCode ^
          date_updated.hashCode ^
          date_created.hashCode ^
          name.hashCode ^
          email.hashCode ^
          bio.hashCode ^
          avatar_url.hashCode;
  }
}

class ConvertDate{
  DateTime dateTime;
  ConvertDate({ required this.dateTime});

  factory ConvertDate.fromTimeStamp( Timestamp time){
    return ConvertDate(
      dateTime: DateTime.fromMillisecondsSinceEpoch(time.seconds * 1000),
    );
  }

  Timestamp toTimeStamp(){
    Timestamp timestamp = Timestamp.fromDate(dateTime);
    return timestamp;
  }
}
