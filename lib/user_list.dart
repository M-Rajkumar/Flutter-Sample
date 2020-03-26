// To parse this JSON data, do
//
//     final userList = userListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserList {
  int id;
  int userType;
  String firstName;
  String lastName;
  String displayName;
  String shortName;
  String photo;
  String degree;
  String speciality;
  String institution;
  String address;
  String shortInfo;
  String biography;
  String curriculumVitae;
  bool prescriber;
  String userStatus;
  String userDisplayStatus;
  String userDisplayStatusColor;

  UserList({
    @required this.id,
    @required this.userType,
    @required this.firstName,
    @required this.lastName,
    @required this.displayName,
    @required this.shortName,
    @required this.photo,
    @required this.degree,
    @required this.speciality,
    @required this.institution,
    @required this.address,
    @required this.shortInfo,
    @required this.biography,
    @required this.curriculumVitae,
    @required this.prescriber,
    @required this.userStatus,
    @required this.userDisplayStatus,
    @required this.userDisplayStatusColor,
  });

  UserList.c1({
    this.id,
    this.userType,
    this.firstName,
    this.lastName,
    this.displayName,
    this.shortName,
    this.photo,
    this.degree,
    this.institution,
    this.shortInfo,
    this.prescriber,
  });

  factory UserList.fromJson(String str) => UserList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserList.fromMap(Map<String, dynamic> json) => UserList(
        id: json["id"] == null ? null : json["id"],
        userType: json["userType"] == null ? null : json["userType"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        shortName: json["shortName"] == null ? null : json["shortName"],
        photo: json["photo"] == null ? null : json["photo"],
        degree: json["degree"] == null ? null : json["degree"],
        speciality: json["speciality"] == null ? null : json["speciality"],
        institution: json["institution"] == null ? null : json["institution"],
        address: json["address"] == null ? null : json["address"],
        shortInfo: json["shortInfo"] == null ? null : json["shortInfo"],
        biography: json["biography"] == null ? null : json["biography"],
        curriculumVitae: json["curriculumVitae"] == null ? null : json["curriculumVitae"],
        prescriber: json["prescriber"] == null ? null : json["prescriber"],
        userStatus: json["userStatus"] == null ? null : json["userStatus"],
        userDisplayStatus: json["userDisplayStatus"] == null ? null : json["userDisplayStatus"],
        userDisplayStatusColor: json["userDisplayStatusColor"] == null ? null : json["userDisplayStatusColor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "userType": userType == null ? null : userType,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "displayName": displayName == null ? null : displayName,
        "shortName": shortName == null ? null : shortName,
        "photo": photo == null ? null : photo,
        "degree": degree == null ? null : degree,
        "speciality": speciality == null ? null : speciality,
        "institution": institution == null ? null : institution,
        "address": address == null ? null : address,
        "shortInfo": shortInfo == null ? null : shortInfo,
        "biography": biography == null ? null : biography,
        "curriculumVitae": curriculumVitae == null ? null : curriculumVitae,
        "prescriber": prescriber == null ? null : prescriber,
        "userStatus": userStatus == null ? null : userStatus,
        "userDisplayStatus": userDisplayStatus == null ? null : userDisplayStatus,
        "userDisplayStatusColor": userDisplayStatusColor == null ? null : userDisplayStatusColor,
      };
}
