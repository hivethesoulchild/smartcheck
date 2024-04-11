
import 'package:smartcheck/backend/backendpy.dart';
import 'dart:async';

var batchData = [];
var batchDataArchive = [];

var answer_key = [[], [], [], []];
var answer_key_temp;
var filtered_answerKey = [[],[],[],[]];

var userList = [];

var userId;
var username;


void setProfile(String id, String name) async {
userId = id;
username = name;
}

void setAnswerKeyCache(Map data) async {
  answer_key = [[], [], [], []];

  for (int i = 0; i <= 30; i++) {
    answer_key[0].add(data["english"][i]);
    answer_key[1].add(data["science"][i]);
    answer_key[2].add(data["mathematics"][i]);
    answer_key[3].add(data["aptitude"][i]);
  }
  answer_key_temp = answer_key;
}

void updateAnswerKeyCache(String subject, String answer, int number) {
  switch (subject) {
    case "english":
      answer_key_temp[0][number] = answer;
      break;
    case "science":
      answer_key_temp[1][number] = answer;
      break;
    case "mathematics":
      answer_key_temp[2][number] = answer;
      break;
    case "aptitude":
      answer_key_temp[3][number] = answer;
      break;
  }
}

void updateAnswerKey (){
  answer_key = answer_key_temp;
}

void resetAnswerKey(){
  answer_key_temp = answer_key;
}

void setUserListCache(List data) {
  userList = data.map((element) => {
    "id": element['_id'],
    "username": element['username'],
    "password": element['password'],
    "role": element['role'],
    "isActive": element['isActive']
  }).toList();
}

void setBatchData(List data) {
  batchData = [];
  batchDataArchive = [];

  for (var element in data) {
    if (element['archive'] == true) {
      batchDataArchive.add({
        "_id": element['_id'],
        "name": element['name'],
        "applicants": element['applicants'],
        "proctor": element['proctor'],
        "date": element['date'],
        "archive": element['archive']
      });
    } else {
      batchData.add({
        "_id": element['_id'],
        "name": element['name'],
        "applicants": element['applicants'],
        "proctor": element['proctor'],
        "date": element['date'],
        "archive": element['archive']
      });
    }
  }
}

// //need to change
// TODO: get the latest answer and get the after date of that answer also set the filtered answer

// Future <void> setAnalysistData() async {
// analysisEnglishData = await BackEndPy.getAnalysisDataEnglish();
// analysisMathData = await BackEndPy.getAnalysisDataMath();
// analysisScienceData = await BackEndPy.getAnalysisDataScience();
// analysisAptitudeData = await BackEndPy.getAnalysisDataAptitude();

// Completer().complete(true);
// }


