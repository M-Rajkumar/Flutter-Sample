import 'package:flutter/material.dart';
import 'package:rdcloseoutsession/shared_pref_utils.dart';
import 'package:rdcloseoutsession/string_constants.dart';
import 'package:rdcloseoutsession/tablet_detector.dart';

mixin BaseClass {
  String baseUrl = '';
  String userType = '',
      userToken = '',
      userName = '',
      userFullName = '',
      userFirstName = '',
      userLastName = '',
      userPhoto = '',
      userPassword = '';

  int userId, userBrandId, userProductId;

  bool canMultiBrand, canMultiProduct, isTablet;
  String userBrandName = '', userProductName = '';
  String fireBaseDatabaseUrl = '', userTimeZone = '', userImageLetter = '';

  void getSharedPreferenceParams(BuildContext context) async {
    baseUrl = await SharedPrefUtils.getStringParams(StringConstants.baseApiUrl);
    userId = await SharedPrefUtils.getIntegerParams(StringConstants.userId);
    userType = await SharedPrefUtils.getStringParams(StringConstants.userType);
    userToken =
        await SharedPrefUtils.getStringParams(StringConstants.userToken);
    userName = await SharedPrefUtils.getStringParams(StringConstants.userName);
    userFullName =
        await SharedPrefUtils.getStringParams(StringConstants.userFullName);
    userFirstName =
        await SharedPrefUtils.getStringParams(StringConstants.userFirstName);
    userLastName =
        await SharedPrefUtils.getStringParams(StringConstants.userLastName);
    userPhoto =
        await SharedPrefUtils.getStringParams(StringConstants.userPhoto);
    userPassword =
        await SharedPrefUtils.getStringParams(StringConstants.userPassword);

    canMultiBrand =
        await SharedPrefUtils.getBoolParams(StringConstants.userSingleBrand);
    canMultiProduct =
        await SharedPrefUtils.getBoolParams(StringConstants.userSingleProduct);

    userBrandId =
        await SharedPrefUtils.getIntegerParams(StringConstants.userBrandId);
    userBrandName =
        await SharedPrefUtils.getStringParams(StringConstants.userBrandName);
    userProductId =
        await SharedPrefUtils.getIntegerParams(StringConstants.userProductId);
    userProductName =
        await SharedPrefUtils.getStringParams(StringConstants.userProductName);

    fireBaseDatabaseUrl = await SharedPrefUtils.getStringParams(
        StringConstants.fireBaseDatabaseUrl);
    userTimeZone =
        await SharedPrefUtils.getStringParams(StringConstants.userTimeZone);

    isTablet = TabletDetector.isTablet(MediaQuery.of(context));

    print('User Full Name --> $userFullName');
    print('User Type --> $userType');
    print('User Token--> $userToken');

    String firstLetter, lastLetter;
    if (userFirstName != '') {
      firstLetter = userFirstName[0];
    } else {
      firstLetter = '';
    }

    if (userLastName != '') {
      lastLetter = userLastName[0];
      userImageLetter = firstLetter + lastLetter;
    } else {
      userImageLetter = '';
    }

    print('User Image Letter--> $userImageLetter');
  }

//  bool isTablet(BuildContext context){
//    return TabletDetector.isTablet(MediaQuery.of(context));
//  }
}
