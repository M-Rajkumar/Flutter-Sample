// To parse this JSON data, do
//
//     final listEngagement = listEngagementFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

class ListEngagement {
  final int statusCode;
  final bool apiStatus;
  final int totalCount;
  final List<HomeResult> result;

  ListEngagement({
    @required this.statusCode,
    @required this.apiStatus,
    @required this.totalCount,
    @required this.result,
  });

  factory ListEngagement.fromJson(String str) =>
      ListEngagement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListEngagement.fromMap(Map<String, dynamic> json) => ListEngagement(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        apiStatus: json["apiStatus"] == null ? null : json["apiStatus"],
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
        result: json["result"] == null
            ? null
            : List<HomeResult>.from(
                json["result"].map((x) => HomeResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode == null ? null : statusCode,
        "apiStatus": apiStatus == null ? null : apiStatus,
        "totalCount": totalCount == null ? null : totalCount,
        "result": result == null
            ? null
            : List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class HomeResult {
  final EngagementType engagementType;
  final int id;
  final User user;
  final String topic;
  final DateTime startTime;
  final String meetingId;
  final Brand brand;
  final Product product;
  final int status;
  final int venueStatus;
  final int isStart;
  final String venueSelectedTimezone;
  final String collaborationMeeting;
  final String displayStatus;
  final List<dynamic> primaryMeeting;
  final List<dynamic> speaker;
  final int invited;
  final int confirmedInvitees;
  final List<dynamic> hcpOrRep;
  final ParticipantStatus participantStatus;
  final int engagementColor = 0;

  HomeResult({
    @required this.engagementType,
    @required this.id,
    @required this.user,
    @required this.topic,
    @required this.startTime,
    @required this.meetingId,
    @required this.brand,
    @required this.product,
    @required this.status,
    @required this.venueStatus,
    @required this.isStart,
    @required this.venueSelectedTimezone,
    @required this.collaborationMeeting,
    @required this.displayStatus,
    @required this.primaryMeeting,
    @required this.speaker,
    @required this.invited,
    @required this.confirmedInvitees,
    @required this.hcpOrRep,
    @required this.participantStatus,
  });

  factory HomeResult.fromJson(String str) =>
      HomeResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HomeResult.fromMap(Map<String, dynamic> json) => HomeResult(
        engagementType: json["engagementType"] == null
            ? null
            : EngagementType.fromMap(json["engagementType"]),
        id: json["id"].toString() == null ? "" : json["id"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        topic: json["topic"] == null ? null : json["topic"],
        startTime: json["start_time"] == null
            ? null
            : DateTime.parse(json["start_time"]),
        meetingId: json["meeting_id"] == null ? null : json["meeting_id"],
        brand: json["brand"] == null ? null : Brand.fromMap(json["brand"]),
        product:
            json["product"] == null ? null : Product.fromMap(json["product"]),
        status: json["status"] == null ? null : json["status"],
        venueStatus: json["venue_status"] == null ? null : json["venue_status"],
        isStart: json["is_start"] == null ? null : json["is_start"],
        venueSelectedTimezone: json["venue_selected_timezone"] == null
            ? null
            : json["venue_selected_timezone"],
        collaborationMeeting: json["collaboration_meeting"] == null
            ? null
            : json["collaboration_meeting"],
        displayStatus:
            json["displayStatus"] == null ? null : json["displayStatus"],
        primaryMeeting: json["primaryMeeting"] == null ? [] : [],
        speaker: json["speaker"] == null
            ? []
            : List<dynamic>.from(json["speaker"].map((x) => x)),
        invited: json["invited"] == null ? null : json["invited"],
        confirmedInvitees: json["confirmed_invitees"] == null
            ? null
            : json["confirmed_invitees"],
        hcpOrRep: json["hcpOrRep"] == null
            ? null
            : List<dynamic>.from(json["hcpOrRep"].map((x) => x)),
        participantStatus: json["participantStatus"] == null
            ? null
            : ParticipantStatus.fromMap(json["participantStatus"]),
      );

  Map<String, dynamic> toMap() => {
        "engagementType":
            engagementType == null ? null : engagementType.toMap(),
        "id": id == null ? null : id,
        "user": user == null ? null : user.toMap(),
        "topic": topic == null ? null : topic,
        "start_time": startTime == null ? null : startTime.toIso8601String(),
        "meeting_id": meetingId == null ? null : meetingId,
        "brand": brand == null ? null : brand.toMap(),
        "product": product == null ? null : product.toMap(),
        "status": status == null ? null : status,
        "venue_status": venueStatus == null ? null : venueStatus,
        "is_start": isStart == null ? null : isStart,
        "venue_selected_timezone":
            venueSelectedTimezone == null ? null : venueSelectedTimezone,
        "collaboration_meeting":
            collaborationMeeting == null ? null : collaborationMeeting,
        "displayStatus": displayStatus == null ? null : displayStatus,
        "primaryMeeting": primaryMeeting == null
            ? null
            : List<dynamic>.from(primaryMeeting.map((x) => x)),
        "speaker":
            speaker == null ? null : List<dynamic>.from(speaker.map((x) => x)),
        "invited": invited == null ? null : invited,
        "confirmed_invitees":
            confirmedInvitees == null ? null : confirmedInvitees,
        "hcpOrRep": hcpOrRep == null
            ? null
            : List<dynamic>.from(hcpOrRep.map((x) => x)),
        "participantStatus":
            participantStatus == null ? null : participantStatus.toMap(),
      };
}

class Brand {
  final String brandName;
  final String brandImage;
  final String uploadPath;
  final String originalBrandImage;
  final int activeStatus;
  final int deleteStatus;
  final int createdBy;
  final int updatedBy;
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int company;

  Brand({
    @required this.brandName,
    @required this.brandImage,
    @required this.uploadPath,
    @required this.originalBrandImage,
    @required this.activeStatus,
    @required this.deleteStatus,
    @required this.createdBy,
    @required this.updatedBy,
    @required this.id,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.company,
  });

  factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        brandName: json["brand_name"] == null ? null : json["brand_name"],
        brandImage: json["brand_image"] == null ? null : json["brand_image"],
        uploadPath: json["upload_path"] == null ? null : json["upload_path"],
        originalBrandImage: json["original_brand_image"] == null
            ? null
            : json["original_brand_image"],
        activeStatus:
            json["active_status"] == null ? null : json["active_status"],
        deleteStatus:
            json["delete_status"] == null ? null : json["delete_status"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        company: json["company"] == null ? null : json["company"],
      );

  Map<String, dynamic> toMap() => {
        "brand_name": brandName == null ? null : brandName,
        "brand_image": brandImage == null ? null : brandImage,
        "upload_path": uploadPath == null ? null : uploadPath,
        "original_brand_image":
            originalBrandImage == null ? null : originalBrandImage,
        "active_status": activeStatus == null ? null : activeStatus,
        "delete_status": deleteStatus == null ? null : deleteStatus,
        "created_by": createdBy == null ? null : createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "company": company == null ? null : company,
      };
}

class EngagementType {
  final String type;
  final String description;
  final int orderNo;
  final int isStart;
  final int minimumHcp;
  final int prescriberHcp;
  final int isCollaborator;
  final int isCohost;
  final int isDetail;
  final int isContentNote;
  final int isQuestion;
  final int amount;
  final int hcpAmount;
  final int activeStatus;
  final int deleteStatus;
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;

  EngagementType({
    @required this.type,
    @required this.description,
    @required this.orderNo,
    @required this.isStart,
    @required this.minimumHcp,
    @required this.prescriberHcp,
    @required this.isCollaborator,
    @required this.isCohost,
    @required this.isDetail,
    @required this.isContentNote,
    @required this.isQuestion,
    @required this.amount,
    @required this.hcpAmount,
    @required this.activeStatus,
    @required this.deleteStatus,
    @required this.id,
    @required this.createdAt,
    @required this.updatedAt,
  });

  factory EngagementType.fromJson(String str) =>
      EngagementType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EngagementType.fromMap(Map<String, dynamic> json) => EngagementType(
        type: json["type"] == null ? null : json["type"],
        description: json["description"] == null ? null : json["description"],
        orderNo: json["order_no"] == null ? null : json["order_no"],
        isStart: json["is_start"] == null ? null : json["is_start"],
        minimumHcp: json["minimum_hcp"] == null ? null : json["minimum_hcp"],
        prescriberHcp:
            json["prescriber_hcp"] == null ? null : json["prescriber_hcp"],
        isCollaborator:
            json["is_collaborator"] == null ? null : json["is_collaborator"],
        isCohost: json["is_cohost"] == null ? null : json["is_cohost"],
        isDetail: json["is_detail"] == null ? null : json["is_detail"],
        isContentNote:
            json["is_content_note"] == null ? null : json["is_content_note"],
        isQuestion: json["is_question"] == null ? null : json["is_question"],
        amount: json["amount"] == null ? null : json["amount"],
        hcpAmount: json["hcp_amount"] == null ? null : json["hcp_amount"],
        activeStatus:
            json["active_status"] == null ? null : json["active_status"],
        deleteStatus:
            json["delete_status"] == null ? null : json["delete_status"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type == null ? null : type,
        "description": description == null ? null : description,
        "order_no": orderNo == null ? null : orderNo,
        "is_start": isStart == null ? null : isStart,
        "minimum_hcp": minimumHcp == null ? null : minimumHcp,
        "prescriber_hcp": prescriberHcp == null ? null : prescriberHcp,
        "is_collaborator": isCollaborator == null ? null : isCollaborator,
        "is_cohost": isCohost == null ? null : isCohost,
        "is_detail": isDetail == null ? null : isDetail,
        "is_content_note": isContentNote == null ? null : isContentNote,
        "is_question": isQuestion == null ? null : isQuestion,
        "amount": amount == null ? null : amount,
        "hcp_amount": hcpAmount == null ? null : hcpAmount,
        "active_status": activeStatus == null ? null : activeStatus,
        "delete_status": deleteStatus == null ? null : deleteStatus,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class ParticipantStatus {
  final int participant;
  final int userType;
  final int status;
  final int meeting;
  final int waitingStatus;
  final int pauseStatus;
  final int leaveStatus;
  final dynamic sessionId;
  final dynamic token;
  final dynamic closeOutBy;
  final int attendeesCloseOutMethod;
  final int signInStatus;
  final dynamic noShowComments;
  final dynamic signInImage;
  final dynamic signInImagePath;
  final int optOutMeal;
  final dynamic optLicState;
  final int ffs;
  final String sessionMins;
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;

  ParticipantStatus({
    @required this.participant,
    @required this.userType,
    @required this.status,
    @required this.meeting,
    @required this.waitingStatus,
    @required this.pauseStatus,
    @required this.leaveStatus,
    @required this.sessionId,
    @required this.token,
    @required this.closeOutBy,
    @required this.attendeesCloseOutMethod,
    @required this.signInStatus,
    @required this.noShowComments,
    @required this.signInImage,
    @required this.signInImagePath,
    @required this.optOutMeal,
    @required this.optLicState,
    @required this.ffs,
    @required this.sessionMins,
    @required this.id,
    @required this.createdAt,
    @required this.updatedAt,
  });

  factory ParticipantStatus.fromJson(String str) =>
      ParticipantStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ParticipantStatus.fromMap(Map<String, dynamic> json) =>
      ParticipantStatus(
        participant: json["participant"] == null ? null : json["participant"],
        userType: json["userType"] == null ? null : json["userType"],
        status: json["status"] == null ? null : json["status"],
        meeting: json["meeting"] == null ? null : json["meeting"],
        waitingStatus:
            json["waiting_status"] == null ? null : json["waiting_status"],
        pauseStatus: json["pause_status"] == null ? null : json["pause_status"],
        leaveStatus: json["leave_status"] == null ? null : json["leave_status"],
        sessionId: json["sessionId"],
        token: json["token"],
        closeOutBy: json["closeOutBy"],
        attendeesCloseOutMethod: json["attendees_close_out_method"] == null
            ? null
            : json["attendees_close_out_method"],
        signInStatus:
            json["sign_in_status"] == null ? null : json["sign_in_status"],
        noShowComments: json["no_show_comments"],
        signInImage: json["sign_in_image"],
        signInImagePath: json["sign_in_image_path"],
        optOutMeal: json["opt_out_meal"] == null ? null : json["opt_out_meal"],
        optLicState: json["opt_lic_state"],
        ffs: json["ffs"] == null ? null : json["ffs"],
        sessionMins: json["session_mins"] == null ? null : json["session_mins"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "participant": participant == null ? null : participant,
        "userType": userType == null ? null : userType,
        "status": status == null ? null : status,
        "meeting": meeting == null ? null : meeting,
        "waiting_status": waitingStatus == null ? null : waitingStatus,
        "pause_status": pauseStatus == null ? null : pauseStatus,
        "leave_status": leaveStatus == null ? null : leaveStatus,
        "sessionId": sessionId,
        "token": token,
        "closeOutBy": closeOutBy,
        "attendees_close_out_method":
            attendeesCloseOutMethod == null ? null : attendeesCloseOutMethod,
        "sign_in_status": signInStatus == null ? null : signInStatus,
        "no_show_comments": noShowComments,
        "sign_in_image": signInImage,
        "sign_in_image_path": signInImagePath,
        "opt_out_meal": optOutMeal == null ? null : optOutMeal,
        "opt_lic_state": optLicState,
        "ffs": ffs == null ? null : ffs,
        "session_mins": sessionMins == null ? null : sessionMins,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Product {
  final String productName;
  final String product;
  final String productDesc;
  final String productIsi;
  final int activeStatus;
  final int deleteStatus;
  final int createdBy;
  final int updatedBy;
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int brand;
  final int company;

  Product({
    @required this.productName,
    @required this.product,
    @required this.productDesc,
    @required this.productIsi,
    @required this.activeStatus,
    @required this.deleteStatus,
    @required this.createdBy,
    @required this.updatedBy,
    @required this.id,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.brand,
    @required this.company,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        productName: json["product_name"] == null ? null : json["product_name"],
        product: json["product"] == null ? null : json["product"],
        productDesc: json["product_desc"] == null ? null : json["product_desc"],
        productIsi: json["product_isi"] == null ? null : json["product_isi"],
        activeStatus:
            json["active_status"] == null ? null : json["active_status"],
        deleteStatus:
            json["delete_status"] == null ? null : json["delete_status"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        brand: json["brand"] == null ? null : json["brand"],
        company: json["company"] == null ? null : json["company"],
      );

  Map<String, dynamic> toMap() => {
        "product_name": productName == null ? null : productName,
        "product": product == null ? null : product,
        "product_desc": productDesc == null ? null : productDesc,
        "product_isi": productIsi == null ? null : productIsi,
        "active_status": activeStatus == null ? null : activeStatus,
        "delete_status": deleteStatus == null ? null : deleteStatus,
        "created_by": createdBy == null ? null : createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "brand": brand == null ? null : brand,
        "company": company == null ? null : company,
      };
}

class User {
  final String firstName;
  final String lastName;
  final String midName;
  final String address2;
  final String affiliation;
  final String govtEmployee;
  final String licensedState;
  final String fullName;
  final String preferredName;
  final String email;
  final String homeNumber;
  final String telephone;
  final dynamic preferredTelephone;
  final String degree;
  final dynamic speciality;
  final dynamic institution;
  final String address;
  final String city;
  final String state;
  final String zip;
  final int prescriber;
  final String area;
  final String region;
  final String district;
  final String territory;
  final dynamic yrsOfExperience;
  final String biography;
  final String biographyPath;
  final String cv;
  final String cvPath;
  final String photo;
  final String photoPath;
  final dynamic publication;
  final dynamic institutionAddress;
  final dynamic institutionAddress1;
  final dynamic institutionState;
  final dynamic institutionZip;
  final dynamic institutionRestriction;
  final dynamic primaryEmail;
  final dynamic secondryEmail;
  final dynamic stateOfLicense;
  final dynamic npi;
  final dynamic decile;
  final String designation;
  final dynamic companyName;
  final String userType;
  final int attendeeType;
  final int noOfLiveprograms;
  final int capAmount;
  final int capMaxLimit;
  final int speakerStatus;
  final int activeStatus;
  final int deleteStatus;
  final String deviceToken;
  final String encryptedTokenReset;
  final int termsCondition;
  final int resetPasswordFlag;
  final int subscribeToNewsletter;
  final int introVideo;
  final int createdBy;
  final int updatedBy;
  final int waitingStatus;
  final dynamic webinarOnly;
  final dynamic patientUser;
  final dynamic stripeId;
  final String employeeId;
  final dynamic imedId;
  final dynamic hireDate;
  final dynamic storageFacilityName;
  final dynamic storagePhone;
  final dynamic storageAddress;
  final dynamic storageUnit;
  final dynamic storageCity;
  final dynamic storageState;
  final dynamic storageZip;
  final dynamic prodBags;
  final dynamic lastUpdated;
  final dynamic salesForceNote;
  final int tier;
  final int loginFlag;
  final int id;
  final String createdAt;
  final DateTime updatedAt;
  final dynamic rep;
  final int dm;
  final dynamic topic;
  final int company;
  final int role;

  User({
    @required this.firstName,
    @required this.lastName,
    @required this.midName,
    @required this.address2,
    @required this.affiliation,
    @required this.govtEmployee,
    @required this.licensedState,
    @required this.fullName,
    @required this.preferredName,
    @required this.email,
    @required this.homeNumber,
    @required this.telephone,
    @required this.preferredTelephone,
    @required this.degree,
    @required this.speciality,
    @required this.institution,
    @required this.address,
    @required this.city,
    @required this.state,
    @required this.zip,
    @required this.prescriber,
    @required this.area,
    @required this.region,
    @required this.district,
    @required this.territory,
    @required this.yrsOfExperience,
    @required this.biography,
    @required this.biographyPath,
    @required this.cv,
    @required this.cvPath,
    @required this.photo,
    @required this.photoPath,
    @required this.publication,
    @required this.institutionAddress,
    @required this.institutionAddress1,
    @required this.institutionState,
    @required this.institutionZip,
    @required this.institutionRestriction,
    @required this.primaryEmail,
    @required this.secondryEmail,
    @required this.stateOfLicense,
    @required this.npi,
    @required this.decile,
    @required this.designation,
    @required this.companyName,
    @required this.userType,
    @required this.attendeeType,
    @required this.noOfLiveprograms,
    @required this.capAmount,
    @required this.capMaxLimit,
    @required this.speakerStatus,
    @required this.activeStatus,
    @required this.deleteStatus,
    @required this.deviceToken,
    @required this.encryptedTokenReset,
    @required this.termsCondition,
    @required this.resetPasswordFlag,
    @required this.subscribeToNewsletter,
    @required this.introVideo,
    @required this.createdBy,
    @required this.updatedBy,
    @required this.waitingStatus,
    @required this.webinarOnly,
    @required this.patientUser,
    @required this.stripeId,
    @required this.employeeId,
    @required this.imedId,
    @required this.hireDate,
    @required this.storageFacilityName,
    @required this.storagePhone,
    @required this.storageAddress,
    @required this.storageUnit,
    @required this.storageCity,
    @required this.storageState,
    @required this.storageZip,
    @required this.prodBags,
    @required this.lastUpdated,
    @required this.salesForceNote,
    @required this.tier,
    @required this.loginFlag,
    @required this.id,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.rep,
    @required this.dm,
    @required this.topic,
    @required this.company,
    @required this.role,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        midName: json["midName"] == null ? null : json["midName"],
        address2: json["address2"] == null ? null : json["address2"],
        affiliation: json["affiliation"] == null ? null : json["affiliation"],
        govtEmployee:
            json["govt_employee"] == null ? null : json["govt_employee"],
        licensedState:
            json["licensed_state"] == null ? null : json["licensed_state"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        preferredName:
            json["preferred_name"] == null ? null : json["preferred_name"],
        email: json["email"] == null ? null : json["email"],
        homeNumber: json["home_number"] == null ? null : json["home_number"],
        telephone: json["telephone"] == null ? null : json["telephone"],
        preferredTelephone: json["preferred_telephone"],
        degree: json["degree"] == null ? null : json["degree"],
        speciality: json["speciality"],
        institution: json["institution"],
        address: json["address"] == null ? "" : json["address"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        zip: json["zip"] == null ? null : json["zip"],
        prescriber: json["prescriber"] == null ? null : json["prescriber"],
        area: json["area"] == null ? null : json["area"],
        region: json["region"] == null ? null : json["region"],
        district: json["district"] == null ? null : json["district"],
        territory: json["territory"] == null ? null : json["territory"],
        yrsOfExperience: json["yrsOfExperience"],
        biography: json["biography"] == null ? null : json["biography"],
        biographyPath:
            json["biography_path"] == null ? null : json["biography_path"],
        cv: json["cv"] == null ? null : json["cv"],
        cvPath: json["cv_path"] == null ? null : json["cv_path"],
        photo: json["photo"] == null ? null : json["photo"],
        photoPath: json["photo_path"] == null ? null : json["photo_path"],
        publication: json["publication"],
        institutionAddress: json["institution_address"],
        institutionAddress1: json["institution_address1"],
        institutionState: json["institution_state"],
        institutionZip: json["institution_zip"],
        institutionRestriction: json["institution_restriction"],
        primaryEmail: json["primary_email"],
        secondryEmail: json["secondry_email"],
        stateOfLicense: json["state_of_license"],
        npi: json["npi"],
        decile: json["decile"],
        designation: json["designation"] == null ? null : json["designation"],
        companyName: json["companyName"],
        userType: json["userType"] == null ? null : json["userType"],
        attendeeType:
            json["attendeeType"] == null ? null : json["attendeeType"],
        noOfLiveprograms: json["no_of_liveprograms"] == null
            ? null
            : json["no_of_liveprograms"],
        capAmount: json["cap_amount"] == null ? null : json["cap_amount"],
        capMaxLimit:
            json["cap_max_limit"] == null ? null : json["cap_max_limit"],
        speakerStatus:
            json["speaker_status"] == null ? null : json["speaker_status"],
        activeStatus:
            json["active_status"] == null ? null : json["active_status"],
        deleteStatus:
            json["delete_status"] == null ? null : json["delete_status"],
        deviceToken: json["deviceToken"] == null ? null : json["deviceToken"],
        encryptedTokenReset: json["encrypted_token_reset"] == null
            ? null
            : json["encrypted_token_reset"],
        termsCondition:
            json["terms_condition"] == null ? null : json["terms_condition"],
        resetPasswordFlag: json["reset_password_flag"] == null
            ? null
            : json["reset_password_flag"],
        subscribeToNewsletter: json["subscribe_to_newsletter"] == null
            ? null
            : json["subscribe_to_newsletter"],
        introVideo: json["intro_video"] == null ? null : json["intro_video"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        waitingStatus:
            json["waiting_status"] == null ? null : json["waiting_status"],
        webinarOnly: json["webinar_only"],
        patientUser: json["patient_user"],
        stripeId: json["stripeId"],
        employeeId: json["employee_id"] == null ? null : json["employee_id"],
        imedId: json["imed_id"],
        hireDate: json["hire_date"],
        storageFacilityName: json["storage_facility_name"],
        storagePhone: json["storage_phone"],
        storageAddress: json["storage_address"],
        storageUnit: json["storage_unit"],
        storageCity: json["storage_city"],
        storageState: json["storage_state"],
        storageZip: json["storage_zip"],
        prodBags: json["prod_bags"],
        lastUpdated: json["last_updated"],
        salesForceNote: json["sales_force_note"],
        tier: json["tier"] == null ? null : json["tier"],
        loginFlag: json["login_flag"] == null ? null : json["login_flag"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        rep: json["rep"],
        dm: json["dm"] == null ? null : json["dm"],
        topic: json["topic"],
        company: json["company"] == null ? null : json["company"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "midName": midName == null ? null : midName,
        "address2": address2 == null ? null : address2,
        "affiliation": affiliation == null ? null : affiliation,
        "govt_employee": govtEmployee == null ? null : govtEmployee,
        "licensed_state": licensedState == null ? null : licensedState,
        "fullName": fullName == null ? null : fullName,
        "preferred_name": preferredName == null ? null : preferredName,
        "email": email == null ? null : email,
        "home_number": homeNumber == null ? null : homeNumber,
        "telephone": telephone == null ? null : telephone,
        "preferred_telephone": preferredTelephone,
        "degree": degree == null ? null : degree,
        "speciality": speciality,
        "institution": institution,
        "address": address == null ? null : address,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "zip": zip == null ? null : zip,
        "prescriber": prescriber == null ? null : prescriber,
        "area": area == null ? null : area,
        "region": region == null ? null : region,
        "district": district == null ? null : district,
        "territory": territory == null ? null : territory,
        "yrsOfExperience": yrsOfExperience,
        "biography": biography == null ? null : biography,
        "biography_path": biographyPath == null ? null : biographyPath,
        "cv": cv == null ? null : cv,
        "cv_path": cvPath == null ? null : cvPath,
        "photo": photo == null ? null : photo,
        "photo_path": photoPath == null ? null : photoPath,
        "publication": publication,
        "institution_address": institutionAddress,
        "institution_address1": institutionAddress1,
        "institution_state": institutionState,
        "institution_zip": institutionZip,
        "institution_restriction": institutionRestriction,
        "primary_email": primaryEmail,
        "secondry_email": secondryEmail,
        "state_of_license": stateOfLicense,
        "npi": npi,
        "decile": decile,
        "designation": designation == null ? null : designation,
        "companyName": companyName,
        "userType": userType == null ? null : userType,
        "attendeeType": attendeeType == null ? null : attendeeType,
        "no_of_liveprograms":
            noOfLiveprograms == null ? null : noOfLiveprograms,
        "cap_amount": capAmount == null ? null : capAmount,
        "cap_max_limit": capMaxLimit == null ? null : capMaxLimit,
        "speaker_status": speakerStatus == null ? null : speakerStatus,
        "active_status": activeStatus == null ? null : activeStatus,
        "delete_status": deleteStatus == null ? null : deleteStatus,
        "deviceToken": deviceToken == null ? null : deviceToken,
        "encrypted_token_reset":
            encryptedTokenReset == null ? null : encryptedTokenReset,
        "terms_condition": termsCondition == null ? null : termsCondition,
        "reset_password_flag":
            resetPasswordFlag == null ? null : resetPasswordFlag,
        "subscribe_to_newsletter":
            subscribeToNewsletter == null ? null : subscribeToNewsletter,
        "intro_video": introVideo == null ? null : introVideo,
        "created_by": createdBy == null ? null : createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "waiting_status": waitingStatus == null ? null : waitingStatus,
        "webinar_only": webinarOnly,
        "patient_user": patientUser,
        "stripeId": stripeId,
        "employee_id": employeeId == null ? null : employeeId,
        "imed_id": imedId,
        "hire_date": hireDate,
        "storage_facility_name": storageFacilityName,
        "storage_phone": storagePhone,
        "storage_address": storageAddress,
        "storage_unit": storageUnit,
        "storage_city": storageCity,
        "storage_state": storageState,
        "storage_zip": storageZip,
        "prod_bags": prodBags,
        "last_updated": lastUpdated,
        "sales_force_note": salesForceNote,
        "tier": tier == null ? null : tier,
        "login_flag": loginFlag == null ? null : loginFlag,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "rep": rep,
        "dm": dm == null ? null : dm,
        "topic": topic,
        "company": company == null ? null : company,
        "role": role == null ? null : role,
      };
}
