import 'backend/backendpy.dart';

var batchData = [];
//english 0, science 1, math 2, aptitude 3
var answer_key = [[],[],[],[]];

void setAnswerKeyCache(Map data)async{
  print('run');
  answer_key = [[],[],[],[]];
  answer_key[0].add(data["english"]["1"]);
  answer_key[0].add(data["english"]["2"]);
  answer_key[0].add(data["english"]["3"]);
  answer_key[0].add(data["english"]["4"]);
  answer_key[0].add(data["english"]["5"]);
  answer_key[0].add(data["english"]["6"]);
  answer_key[0].add(data["english"]["7"]);
  answer_key[0].add(data["english"]["8"]);
  answer_key[0].add(data["english"]["9"]);
  answer_key[0].add(data["english"]["10"]);
  answer_key[0].add(data["english"]["11"]);
  answer_key[0].add(data["english"]["12"]);
  answer_key[0].add(data["english"]["13"]);
  answer_key[0].add(data["english"]["14"]);
  answer_key[0].add(data["english"]["15"]);
  answer_key[0].add(data["english"]["16"]);
  answer_key[0].add(data["english"]["17"]);
  answer_key[0].add(data["english"]["18"]);
  answer_key[0].add(data["english"]["19"]);
  answer_key[0].add(data["english"]["20"]);
  answer_key[0].add(data["english"]["21"]);
  answer_key[0].add(data["english"]["22"]);
  answer_key[0].add(data["english"]["23"]);
  answer_key[0].add(data["english"]["24"]);
  answer_key[0].add(data["english"]["25"]);
  answer_key[0].add(data["english"]["26"]);
  answer_key[0].add(data["english"]["27"]);
  answer_key[0].add(data["english"]["28"]);
  answer_key[0].add(data["english"]["29"]);
  answer_key[0].add(data["english"]["30"]);
  answer_key[0].add(data["english"]["31"]);
  answer_key[0].add(data["english"]["32"]);
  answer_key[0].add(data["english"]["33"]);
  answer_key[0].add(data["english"]["34"]);
  answer_key[0].add(data["english"]["35"]);
  answer_key[0].add(data["english"]["36"]);
  answer_key[0].add(data["english"]["37"]);
  answer_key[0].add(data["english"]["38"]);
  answer_key[0].add(data["english"]["39"]);
  answer_key[0].add(data["english"]["40"]);

  answer_key[1].add(data["science"]["1"]);
  answer_key[1].add(data["science"]["2"]);
  answer_key[1].add(data["science"]["3"]);
  answer_key[1].add(data["science"]["4"]);
  answer_key[1].add(data["science"]["5"]);
  answer_key[1].add(data["science"]["6"]);
  answer_key[1].add(data["science"]["7"]);
  answer_key[1].add(data["science"]["8"]);
  answer_key[1].add(data["science"]["9"]);
  answer_key[1].add(data["science"]["10"]);
  answer_key[1].add(data["science"]["11"]);
  answer_key[1].add(data["science"]["12"]);
  answer_key[1].add(data["science"]["13"]);
  answer_key[1].add(data["science"]["14"]);
  answer_key[1].add(data["science"]["15"]);
  answer_key[1].add(data["science"]["16"]);
  answer_key[1].add(data["science"]["17"]);
  answer_key[1].add(data["science"]["18"]);
  answer_key[1].add(data["science"]["19"]);
  answer_key[1].add(data["science"]["20"]);
  answer_key[1].add(data["science"]["21"]);
  answer_key[1].add(data["science"]["22"]);
  answer_key[1].add(data["science"]["23"]);
  answer_key[1].add(data["science"]["24"]);
  answer_key[1].add(data["science"]["25"]);
  answer_key[1].add(data["science"]["26"]);
  answer_key[1].add(data["science"]["27"]);
  answer_key[1].add(data["science"]["28"]);
  answer_key[1].add(data["science"]["29"]);
  answer_key[1].add(data["science"]["30"]);
  answer_key[1].add(data["science"]["31"]);
  answer_key[1].add(data["science"]["32"]);
  answer_key[1].add(data["science"]["33"]);
  answer_key[1].add(data["science"]["34"]);
  answer_key[1].add(data["science"]["35"]);
  answer_key[1].add(data["science"]["36"]);
  answer_key[1].add(data["science"]["37"]);
  answer_key[1].add(data["science"]["38"]);
  answer_key[1].add(data["science"]["39"]);
  answer_key[1].add(data["science"]["40"]);

  answer_key[2].add(data["mathematics"]["1"]);
  answer_key[2].add(data["mathematics"]["2"]);
  answer_key[2].add(data["mathematics"]["3"]);
  answer_key[2].add(data["mathematics"]["4"]);
  answer_key[2].add(data["mathematics"]["5"]);
  answer_key[2].add(data["mathematics"]["6"]);
  answer_key[2].add(data["mathematics"]["7"]);
  answer_key[2].add(data["mathematics"]["8"]);
  answer_key[2].add(data["mathematics"]["9"]);
  answer_key[2].add(data["mathematics"]["10"]);
  answer_key[2].add(data["mathematics"]["11"]);
  answer_key[2].add(data["mathematics"]["12"]);
  answer_key[2].add(data["mathematics"]["13"]);
  answer_key[2].add(data["mathematics"]["14"]);
  answer_key[2].add(data["mathematics"]["15"]);
  answer_key[2].add(data["mathematics"]["16"]);
  answer_key[2].add(data["mathematics"]["17"]);
  answer_key[2].add(data["mathematics"]["18"]);
  answer_key[2].add(data["mathematics"]["19"]);
  answer_key[2].add(data["mathematics"]["20"]);
  answer_key[2].add(data["mathematics"]["21"]);
  answer_key[2].add(data["mathematics"]["22"]);
  answer_key[2].add(data["mathematics"]["23"]);
  answer_key[2].add(data["mathematics"]["24"]);
  answer_key[2].add(data["mathematics"]["25"]);
  answer_key[2].add(data["mathematics"]["26"]);
  answer_key[2].add(data["mathematics"]["27"]);
  answer_key[2].add(data["mathematics"]["28"]);
  answer_key[2].add(data["mathematics"]["29"]);
  answer_key[2].add(data["mathematics"]["30"]);
  answer_key[2].add(data["mathematics"]["31"]);
  answer_key[2].add(data["mathematics"]["32"]);
  answer_key[2].add(data["mathematics"]["33"]);
  answer_key[2].add(data["mathematics"]["34"]);
  answer_key[2].add(data["mathematics"]["35"]);
  answer_key[2].add(data["mathematics"]["36"]);
  answer_key[2].add(data["mathematics"]["37"]);
  answer_key[2].add(data["mathematics"]["38"]);
  answer_key[2].add(data["mathematics"]["39"]);
  answer_key[2].add(data["mathematics"]["40"]);

  answer_key[3].add(data["aptitude"]["1"]);
  answer_key[3].add(data["aptitude"]["2"]);
  answer_key[3].add(data["aptitude"]["3"]);
  answer_key[3].add(data["aptitude"]["4"]);
  answer_key[3].add(data["aptitude"]["5"]);
  answer_key[3].add(data["aptitude"]["6"]);
  answer_key[3].add(data["aptitude"]["7"]);
  answer_key[3].add(data["aptitude"]["8"]);
  answer_key[3].add(data["aptitude"]["9"]);
  answer_key[3].add(data["aptitude"]["10"]);
  answer_key[3].add(data["aptitude"]["11"]);
  answer_key[3].add(data["aptitude"]["12"]);
  answer_key[3].add(data["aptitude"]["13"]);
  answer_key[3].add(data["aptitude"]["14"]);
  answer_key[3].add(data["aptitude"]["15"]);

  print(answer_key);
}

void updateAnswerKeyCache(String subject, String answer, int number){
  if(subject == "english"){
    answer_key[0][number] = answer;

  }else if(subject == "science"){
    answer_key[1][number] = answer;
  }else if(subject == "mathematics"){
    answer_key[2][number] = answer;
  }else if(subject == "aptitude"){
    answer_key[3][number] = answer;
    print(answer_key[3]);
  }
}

void updateAnswerKeyDatabase() async{
  print(answer_key[3]);
}



