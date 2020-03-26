import 'dart:collection';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:rdcloseoutsession/showToastMessage.dart';
import 'package:rdcloseoutsession/user_list.dart';
import 'package:rdcloseoutsession/user_list_item_closeout.dart';
import 'package:signature/signature.dart';

import 'custom_app_bar.dart';
import 'custom_app_theme.dart';
import 'dialog_text_container.dart';
import 'engagement.dart';
import 'input_form_container.dart';
import 'live_answer.dart';
import 'live_question.dart';

enum closeOutAction {
  noShow,
  signIn,
  survey,
}

class EOCloseOutPage extends StatefulWidget {
  Engagement engagement;

  EOCloseOutPage([this.engagement]);

  @override
  _EOCloseOutPageState createState() => _EOCloseOutPageState();
}

class _EOCloseOutPageState extends State<EOCloseOutPage> {
  List<UserList> userListItems;
  String selectedItem = closeOutAction.signIn.toString();
  int selectedIndex = -1;
  int selectedItemIndex = -1;
  bool isMeal = false;
  String userName = '';
  List<SignatureController> _signatureController = List();
  List<LiveQuestion> questionAnswer;

//  Map<String, LiveAnswer> selectedAnswerMap = new Map();
  static final _key = new GlobalKey();

  Map<String, Map<String, LiveAnswer>> liveAnswerMap;
  Map selectedSurvey = new Map();
  Map<String, LiveAnswer> liveMap;
  LiveAnswer liveAnswer;

  List<String> selectedList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userListItems = new List();
    questionAnswer = new List();
    liveAnswerMap = new Map();
    liveMap = new HashMap();
    userListItems = [
      UserList.c1(
        id: 5,
        userType: 1,
        firstName: 'Arun',
        lastName: 'A',
        displayName: 'Arun A',
        shortName: 'AA',
        photo: '',
        degree: 'M.E',
        institution: 'PSN',
        shortInfo: 'Pondicherry, IN',
        prescriber: false,
      ),
      UserList.c1(
        id: 2,
        userType: 1,
        firstName: 'Arun',
        lastName: 'A',
        displayName: 'Prethiv Raj',
        shortName: 'AA',
        photo: '',
        degree: 'M.E',
        institution: 'PSN',
        shortInfo: 'Pondicherry, IN',
        prescriber: false,
      ),
//      UserList.c1(
//        id: 3,
//        userType: 1,
//        firstName: 'Arun',
//        lastName: 'A',
//        displayName: 'Hassini',
//        shortName: 'AA',
//        photo: '',
//        degree: 'M.E',
//        institution: 'PSN',
//        shortInfo: 'Pondicherry, IN',
//        prescriber: false,
//      ),
//      UserList.c1(
//        id: 4,
//        userType: 1,
//        firstName: 'Arun',
//        lastName: 'A',
//        displayName: 'Dharma',
//        shortName: 'AA',
//        photo: '',
//        degree: 'M.E',
//        institution: 'PSN',
//        shortInfo: 'Pondicherry, IN',
//        prescriber: false,
//      ),
//      UserList.c1(
//        id: 5,
//        userType: 1,
//        firstName: 'Arun',
//        lastName: 'A',
//        displayName: 'Vasanth',
//        shortName: 'AA',
//        photo: '',
//        degree: 'M.E',
//        institution: 'PSN',
//        shortInfo: 'Pondicherry, IN',
//        prescriber: false,
//      ),
//      UserList.c1(
//        id: 6,
//        userType: 1,
//        firstName: 'Arun',
//        lastName: 'A',
//        displayName: 'Naresh Kumar',
//        shortName: 'AA',
//        photo: '',
//        degree: 'M.E',
//        institution: 'PSN',
//        shortInfo: 'Pondicherry, IN',
//        prescriber: false,
//      ),
    ];
    getQuestionList();
  }

  void getQuestionList() async {
    String list = await DefaultAssetBundle.of(context)
        .loadString("assets/questionList.json");
    List<dynamic> lists = json.decode(list);
    lists.forEach((f) {
      LiveQuestion s = LiveQuestion.fromMap(f);
      questionAnswer.add(s);
    });
  }

  void selectedIndexListener(int index, int questionId, String questionType,
      String questionOption, String answer, UserList user, String typeSingIn) {
    setState(() {
      switch (questionType.toLowerCase()) {
        case 'text':
          if (answer != '' && answer != null) {
            LiveAnswer liveAnswer =
                new LiveAnswer(questionId, questionType, answer, null);
            Map<String, LiveAnswer> answerMap =
                liveAnswerMap[user.id.toString()];
            if (answerMap == null) {
              answerMap = new Map();
            }
            answerMap[questionId.toString()] = liveAnswer;
            liveAnswerMap[user.id.toString()] = answerMap;
          } else {
            Map<String, LiveAnswer> answerMap =
                liveAnswerMap[user.id.toString()];
            if (answerMap != null) {
              answerMap.remove(questionId.toString());
              if (answerMap.length == 0) {
                liveAnswerMap.remove(user.id.toString());
              }
            } else {
              liveAnswerMap.remove(user.id.toString());
            }
          }
          break;
        case 'radio':
        case 'yes or no':
          LiveAnswer liveAnswer =
              new LiveAnswer(questionId, questionType, answer, null);
          Map<String, LiveAnswer> answerMap = liveAnswerMap[user.id.toString()];
          if (answerMap == null) {
            answerMap = new Map();
          }
          answerMap[questionId.toString()] = liveAnswer;
          liveAnswerMap[user.id.toString()] = answerMap;

          liveAnswerMap.forEach((f, v) {
            print('Live user id: $f');
            v.forEach((f, g) {
              print('Live answer selected value: $f --> ${g.answer}');
            });
          });

          break;

        default:
          Map<String, LiveAnswer> answerMap = liveAnswerMap[user.id.toString()];
          if (answerMap != null) {
            LiveAnswer liveAnswer = answerMap[questionId.toString()];
            if (liveAnswer == null) {
              List<String> answers = new List();
              answers.add(answer);
              LiveAnswer liveAnswer =
                  new LiveAnswer(questionId, questionType, '', answers);
              answerMap[questionId.toString()] = liveAnswer;
              liveAnswerMap[user.id.toString()] = answerMap;
            } else {
              if (liveAnswer.getAnswerList() != null) {
                List<String> answers = liveAnswer.getAnswerList();
                if (answers.contains(answer)) {
                  answers.remove(answer);
                } else {
                  answers.add(answer);
                }

                if (answers.length != 0) {
                  liveAnswer =
                      new LiveAnswer(questionId, questionType, '', answers);
                  answerMap[questionId.toString()] = liveAnswer;
                  liveAnswerMap[user.id.toString()] = answerMap;
                } else {
                  answerMap.remove(questionId.toString());
                  if (answerMap.length == 0) {
                    liveAnswerMap.remove(user.id.toString());
                  }
                }
              } else {
                List<String> answers = new List();
                answers.add(answer);
                LiveAnswer liveAnswer =
                    new LiveAnswer(questionId, questionType, '', answers);
                answerMap[questionId.toString()] = liveAnswer;
                liveAnswerMap[user.id.toString()] = answerMap;
              }
            }
          } else {
            answerMap = new Map();
            List<String> answers = new List();
            answers.add(answer);
            LiveAnswer liveAnswer =
                new LiveAnswer(questionId, questionType, '', answers);
            answerMap[questionId.toString()] = liveAnswer;
            liveAnswerMap[user.id.toString()] = answerMap;
          }

          liveAnswerMap.forEach((f, v) {
            print('Live user id: $f');
            v.forEach((f, g) {
              print(
                  'Live answer selected value:dd $f --> ${g.answer} : ${g.answerList}');
            });
          });

          break;
      }
    });
  }

  bool checkBoxValidation(String optionId, String optionText) {
    setState(() {
      if (liveAnswer != null && liveAnswer.getAnswerList() != null) {
        List<String> answers = liveAnswer.getAnswerList();
        print(
            '$optionText --> ${answers.contains(optionId) || answers.contains(optionText)}');
        return answers.contains(optionId) || answers.contains(optionText);
      }
      return false;
    });
  }

  void surveySubmitValidation(BuildContext context, String meetingId,
      String userId, String userName, Map<String, LiveAnswer> answerMapItem) {
    if (answerMapItem != null &&
        answerMapItem.length > 0 &&
        questionAnswer.length <= answerMapItem.length) {
      HashMap<String, Object> params = new HashMap();
      params.putIfAbsent("meeting_id", () => meetingId);
      params.putIfAbsent("user_id", () => userId);

      List<Map> mapList = new List();
      if (answerMapItem != null) {
        for (MapEntry<String, LiveAnswer> entry in answerMapItem.entries) {
          LiveAnswer liveAnswer = entry.value;
          mapList.add(liveAnswer.toPost());
        }
      }
      params.putIfAbsent("survey_answer", () => mapList);
      print('Survy Submit Parameter --> ${params.toString()}');
    } else {
      CommonUtils.showToastMessage(
        context: context,
        message: 'Please answer all questions',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppTheme.bgGreyColor,
      appBar: CustomAppBar(
        title: 'Close Out EO',
      ),
      body: Container(
        child: Column(
          key: _key,
          children: <Widget>[
            //            Visibility(
            //              visible: false,
            //              child: EngagementInfoContainer(
            //                engagement: widget.engagement ?? '',
            //                isTabletDevice: false,
            //                textColor: Colors.white,
            //                containerColor: Theme.of(context).buttonColor,
            //                containerPadding: EdgeInsets.only(left: 10.0, right: 10.0),
            //              ),
            //            ),
            Flexible(
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userListItems == null ? 0 : userListItems.length,
                  itemBuilder: (context, index) {
                    _signatureController.add(
                      SignatureController(
                          penStrokeWidth: 2, penColor: Colors.black),
                    );
                    UserList userList = userListItems[index];
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          UserListItemCloseOut(
                            userList: userList,
                            colorAvatarBg: Theme.of(context).buttonColor,
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 10.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: SizedBox(
                                      height: 32,
                                      child: MaterialButton(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        color: Theme.of(context).buttonColor,
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Visibility(
                                              visible: false,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'No Show',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 32,
                                      child: MaterialButton(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        color: Theme.of(context).buttonColor,
                                        onPressed: () {
                                          if (selectedIndex != index) {
                                            setState(() {
                                              selectedIndex = index;
                                              selectedItem = closeOutAction
                                                  .signIn
                                                  .toString();
                                            });
                                          } else {
                                            if (selectedItem !=
                                                closeOutAction.signIn
                                                    .toString()) {
                                              setState(() {
                                                selectedList = new List();
                                                selectedItem = closeOutAction
                                                    .signIn
                                                    .toString();
                                              });
                                            }
                                          }
                                          setState(() {
                                            _signatureController[index].clear();
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Visibility(
                                              visible: false,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Sign In',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 32,
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        color: Colors.grey[500],
                                        onPressed: () {
                                          setState(() {
                                            if (_signatureController[index]
                                                .isNotEmpty) {
                                              if (selectedIndex != index) {
                                                selectedIndex = index;
                                                selectedItem = closeOutAction
                                                    .survey
                                                    .toString();
                                              } else {
                                                if (selectedItem !=
                                                    closeOutAction.survey
                                                        .toString()) {
                                                  selectedItem = closeOutAction
                                                      .survey
                                                      .toString();
                                                }
                                              }
                                            }
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Visibility(
                                              visible: false,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Survey',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Visibility(
                            visible: selectedIndex == index &&
                                selectedItem != null &&
                                selectedItem != '' &&
                                selectedItem ==
                                    closeOutAction.signIn.toString(),
                            child: Container(
                              //                              color: CustomAppTheme.lightGreyColor,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    //                                    height: 180.0,
                                    //                                    width: MediaQuery.of(context).size.width,
                                    //                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      //                                      color: CustomAppTheme.lightGreyColor,
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                    child: Container(
                                      child: Stack(
                                        //                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        //                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                color: CustomAppTheme
                                                    .lightGreyColor,
                                                child: Signature(
                                                  controller:
                                                      _signatureController[
                                                          index],
                                                  height: 150.0,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  backgroundColor:
                                                      CustomAppTheme
                                                          .lightGreyColor,
                                                ),
                                              ),
                                              //                                              Center(
                                              //                                                child: Container(
                                              //                                                  height: 150.0,
                                              //                                                  child: CachedNetworkImage(
                                              //                                                    imageUrl:
                                              //                                                        'https://avexisstaging.radiusdirect.net/coreapi//images/signinimage/dEIvgnaD.png',
                                              //                                                    fit: BoxFit.scaleDown,
                                              //                                                  ),
                                              //                                                ),
                                              //                                              )
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _signatureController[index]
                                                        .clear();
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.refresh,
                                                  color: Theme.of(context)
                                                      .buttonColor,
                                                  size: 36,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: false,
                                    child: Container(
                                      color: CustomAppTheme.lightGreyColor,
                                      //                                    decoration: BoxDecoration(
                                      //                                      color: CustomAppTheme.lightGreyColor,
                                      //                                      shape: BoxShape.rectangle,
                                      //                                    ),
                                      child: GestureDetector(
                                        child: new Row(
                                          children: <Widget>[
                                            Checkbox(
                                              activeColor:
                                                  Theme.of(context).buttonColor,
                                              value: isMeal,
                                              onChanged: (value) =>
                                                  setState(() {
                                                isMeal = !isMeal;
                                              }),
                                            ),
                                            Text(
                                              'Opt out of meal',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        onTap: () => setState(() {
                                          isMeal = !isMeal;
                                        }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: selectedIndex == index &&
                                selectedItem != null &&
                                selectedItem != '' &&
                                selectedItem ==
                                    closeOutAction.survey.toString(),
                            child: Container(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: questionAnswer == null
                                      ? 0
                                      : questionAnswer.length,
                                  itemBuilder: (context, index) {
                                    LiveQuestion questions =
                                        questionAnswer[index];
                                    QuestionType questionType =
                                        questions.questionType;
                                    return Container(
                                      padding: EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                          top: 10.0,
                                          bottom: 10.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            questions.question,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.0),
                                          ),
                                          getQuestionType(index, questions,
                                              questionType, userList),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Visibility(
                            visible: selectedIndex == index,
                            child: Container(
                              //                                    color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Visibility(
                                    visible: true,
                                    child: Divider(
                                      height: 0.0,
                                    ),
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Expanded(
                                          child: TextContainer(
                                            borderRadiusGeometry:
                                                BorderRadius.only(
                                              bottomLeft: Radius.circular(6.0),
                                              bottomRight: Radius.circular(0.0),
                                            ),
                                            title: 'Cancel',
                                            onTapped: () {
                                              setState(() {
                                                selectedIndex = -1;
                                                if (selectedItem != null &&
                                                    selectedItem != '' &&
                                                    selectedItem ==
                                                        closeOutAction.signIn
                                                            .toString()) {
                                                  selectedItem = closeOutAction
                                                      .signIn
                                                      .toString();
                                                } else if (selectedItem !=
                                                        null &&
                                                    selectedItem != '' &&
                                                    selectedItem ==
                                                        closeOutAction.survey
                                                            .toString()) {
                                                  selectedItem = closeOutAction
                                                      .survey
                                                      .toString();
                                                }
                                              });
                                            },
                                            textStyle: CustomAppTheme
                                                .customDialogButton,
                                          ),
                                        ),
                                        VerticalDivider(
                                          width: 0,
                                        ),
                                        Expanded(
                                          child: TextContainer(
                                            borderRadiusGeometry:
                                                BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(6.0),
                                            ),
                                            title: 'Submit',
                                            onTapped: () {
                                              if (selectedItem != null &&
                                                  selectedItem != '' &&
                                                  selectedItem ==
                                                      closeOutAction.signIn
                                                          .toString()) {
                                                if (_signatureController[index]
                                                    .isEmpty) {
                                                  CommonUtils.showToastMessage(
                                                    context: context,
                                                    message:
                                                        'Your signature is required before submitting this form',
                                                  );
                                                } else {
                                                  if (selectedIndex != -1) {
                                                    setState(() {
                                                      selectedIndex = index;
                                                      //                                                      selectedList.clear();
                                                      //                                                      liveMap.clear();
                                                      //                                                      liveAnswerMap.clear();
                                                      selectedItem =
                                                          closeOutAction.survey
                                                              .toString();
                                                    });
                                                  }
                                                }
                                              } else if (selectedItem != null &&
                                                  selectedItem != '' &&
                                                  selectedItem ==
                                                      closeOutAction.survey
                                                          .toString()) {
                                                surveySubmitValidation(
                                                    context,
                                                    '1',
                                                    userList.id.toString(),
                                                    userList.displayName,
                                                    liveMap);

                                                //                                                HashMap<String, String> params = new HashMap();
                                                //                                                if (questionAnswer != null &&
                                                //                                                    selectedAnswerMap != null &&
                                                //                                                    questionAnswer.length <= selectedAnswerMap.length) {
                                                //                                                  selectedAnswerMap.forEach(
                                                //                                                    (f, v) {
                                                ////                                                      print('Selected Map String --> $f :  ${v.optionText}');
                                                ////                                                      params.putIfAbsent('question', () => f.toString());
                                                ////                                                      params.putIfAbsent('option', () => v.optionNumber.toString());
                                                //                                                    },
                                                //                                                  );
                                                //                                                } else {
                                                //                                                  CommonUtils.showToastMessage(
                                                //                                                    context: context,
                                                //                                                    message: 'Please answer all questions',
                                                //                                                  );
                                                //                                                }
                                                //                                                print('Selected Map answer --> ${params.toString()}');
                                                //                                                print('Selected Map count --> ${selectedAnswerMap.length}');
                                              }
                                            },
                                            textStyle: CustomAppTheme
                                                .customDialogButton,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  liveAnswerMapping(String userId, String questionId,
      [String optionText = '']) {
    setState(() {
      liveAnswer = null;
      liveMap = liveAnswerMap[userId];
      if (liveMap != null) {
        liveAnswer = liveMap[questionId];
        if (liveAnswer == null) {
          liveAnswer = liveMap['hcp'];
        }
        if (liveAnswer != null &&
            liveAnswer?.getAnswerList() != null &&
            liveAnswer.getAnswerList().length > 0) {
          for (String item in liveAnswer.getAnswerList()) {
            if (item.contains(questionId) || item.contains(optionText)) {
              selectedList.add(questionId);
            } else {
              selectedList.remove(questionId);
            }
          }
        }
      }
    });
  }

  Widget getQuestionType(
    int indexHeader,
    LiveQuestion questionAnswer,
    QuestionType questionType,
    UserList userList,
  ) {
    if (questionType?.typeName != null && questionType?.typeName != '') {
      if (questionType.typeName.toLowerCase() != 'text') {
        return Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: questionAnswer.questionOptions == null
                ? 0
                : questionAnswer.questionOptions.length,
            itemBuilder: (context, indexItem) {
              QuestionOption questionOption =
                  questionAnswer.questionOptions[indexItem];

//              WidgetsBinding.instance.addPostFrameCallback((_) {
//
//              });

              if (questionType.typeName.toLowerCase() == 'radio') {
                Future.delayed(Duration.zero, () {
//                liveAnswer = null;
                  liveAnswerMapping(
                      userList.id.toString(), questionAnswer.id.toString());
                  selectedSurvey[questionAnswer.id] =
                      int.parse(liveAnswer?.getAnswer() ?? '-1');
                });
                return RadioListTile(
                  activeColor: Theme.of(context).buttonColor,
                  dense: true,
                  value: questionOption.id,
                  groupValue: selectedSurvey[questionAnswer.id],
                  title: Text(
                    questionOption.optionText,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onChanged: (option) {
                    selectedIndexListener(
                      indexItem,
                      questionAnswer.id,
                      questionType.typeName,
                      questionOption.optionText,
                      questionOption.id.toString(),
                      userList,
                      '',
                    );
//                    liveAnswer = null;
//                    liveAnswerMapping(userList.id.toString(), questionAnswer.id.toString());
//                    print('Seleceted Live Answer --> ${option}');
//                    print('Seleceted Live user Id --> ${userList.id.toString()}');
//                    print('Seleceted Live map answer --> ${liveAnswer?.getAnswer()}');
                    selectedSurvey[questionAnswer.id] =
                        int.parse(liveAnswer?.getAnswer() ?? '-1');
                  },
                );
              } else {
                Future.delayed(Duration.zero, () {
                  liveAnswerMapping(userList.id.toString(),
                      questionAnswer.id.toString(), questionOption.optionText);
                });
                return CheckboxListTile(
                  activeColor: Theme.of(context).buttonColor,
                  dense: true,
                  title: Text(
                    questionOption.optionText,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onChanged: (option) {
                    selectedIndexListener(
                      indexItem,
                      questionAnswer.id,
                      questionType.typeName,
                      questionOption.optionText,
                      questionOption.id.toString(),
                      userList,
                      '',
                    );
                    liveAnswerMapping(
                        userList.id.toString(),
                        questionAnswer.id.toString(),
                        questionOption.optionText);
                    setState(() {
                      if (selectedList != null &&
                          selectedList.contains(questionOption.id.toString())) {
                        selectedList.remove(questionOption.id.toString());
                      } else {
                        selectedList.add(questionOption.id.toString());
                      }
                    });
                  },
                  value: selectedList.contains(questionOption.id.toString()) ||
                          selectedList
                              .contains(questionOption.optionText.toString()) ??
                      false,
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }
            },
          ),
        );
      } else if (questionType.typeName.toLowerCase() == 'text') {
        Future.delayed(Duration.zero, () {
          liveAnswerMapping(
              userList.id.toString(), questionAnswer.id.toString());
        });
        return Container(
          child: InputFormContainer(
            fieldTitle: '',
            initialValue:
                liveAnswer?.getAnswer() != null && liveAnswer?.getAnswer() != ''
                    ? liveAnswer?.getAnswer()
                    : '' ?? '',
            fieldTitleStyle: TextStyle(fontWeight: FontWeight.w700),
            textInputType: TextInputType.multiline,
            minLines: 5,
            edgeInsetsGeometry: EdgeInsets.all(0.0),
            bottomSpace: 10.0,
            textChanged: (val) {
              selectedIndexListener(
                indexHeader,
                questionAnswer.id,
                questionType.typeName,
                '',
                val,
                userList,
                '',
              );
//              liveAnswerMapping(userList.id.toString(), questionAnswer.id.toString());
            },
          ),
        );
      }
    }

    return Container();
  }
}
