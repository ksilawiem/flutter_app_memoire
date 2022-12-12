import 'package:app_flutter_memoir/api_models/Offre_Models/AddOffreQuestion_Model.dart';
import 'package:flutter/material.dart';

import '../../request/offres_req/AddOffre_Question_api.dart';
import '../../request/offres_req/AddOffre_Question_api.dart';
import '../../request/offres_req/AddoffresAnswer_api.dart';
import '../api_models/Offre_Models/AnswerOffre_Model.dart';
import '../api_models/Offre_Models/ListAnswerOffre_Model.dart';
import '../api_models/Offre_Models/QuestionOffre_Model.dart';
import '../api_models/Offre_Models/listOffreQuestion_Model.dart';
import '../api_models/Offre_Models/offre_model.dart';
import '../api_models/Test_Models/Quiz_questionModel.dart';
import '../api_models/Test_Models/quiz-answer_Model.dart';
import '../request/Test_gratuit_req/Quiz_Answer_api.dart';
import '../request/Test_gratuit_req/Quiz_Question_api.dart';
import '../request/offres_req/AnswerOffre_api.dart';
import '../request/offres_req/ListAnswerOffre_Api.dart';
import '../request/offres_req/ListQuestionOffre_api.dart';
import '../request/offres_req/PostulerAnswer_offre_api.dart';
import '../request/offres_req/QuestionOffre_api.dart';
import '../save/save.dart';

class PasserTestOffre extends StatefulWidget {
  PasserTestOffre({
    Key? key,
    required this.offre,
  }) : super(key: key);

  Offres offre;

  @override
  State<PasserTestOffre> createState() => _PasserTestOffreState();
}

class _PasserTestOffreState extends State<PasserTestOffre> {
  ListQuestionOffre_Model? _questionOffre_Model;
  ListAnswerOffre_Model? _listAnswerOffre_Model;
  int pos = 0;
  @override
  void initState() {
    super.initState();
    getq(
      offreId: widget.offre.id.toString(),
    );
  }

  final _formKey = GlobalKey<FormState>();
  bool ch1 = false;
  bool ch2 = false;
  bool ch3 = false;
  TextEditingController q1 = TextEditingController();
  TextEditingController ans1 = TextEditingController();
  TextEditingController ans2 = TextEditingController();
  TextEditingController ans3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("@@@@@@@@@@" * 10);
    int v = ch1 ? 1 : 0;
    /*  Map<String, dynamic> m = {
      "ch": ch1 ? 1 : 0,
      "v":
    };*/
    print(
        "ch1 ? 1 : 0   =>$v      ch2 ? 1 : 0   =>${ch2 ? 1 : 0}       ch3 ? 1 : 0   =>${ch3 ? 1 : 0}");
    //print(ch2 ? 1 : 0);
    //print(ch3 ? 1 : 0);

    print("@@@@@@@@@@" * 10);
    return Scaffold(
        //resizeToAvoidBottomPadding: false, // keyboard will cover floating elements
        appBar: AppBar(title: Text('Passer le test')),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: q1,
                decoration: InputDecoration(
                  labelText: 'Question',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                // The validator receives the text that the user has entered.
              ),
              Row(children: [
                Expanded(
                    child: TextField(
                  controller: ans1,
                  decoration: InputDecoration(
                    labelText: 'Answer 1',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                )),
                Checkbox(
                  onChanged: (v) {
                    ch1 = v!;
                    setState(() {});
                  },
                  value: ch1,
                )
              ]),
              Row(children: [
                Expanded(
                    child: TextField(
                  controller: ans2,
                  decoration: InputDecoration(
                    labelText: 'Answer 2',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                )),
                Checkbox(
                  onChanged: (v) {
                    ch2 = v!;
                    setState(() {});
                  },
                  value: ch2,
                )
              ]),
              Row(children: [
                Expanded(
                    child: TextField(
                  controller: ans3,
                  decoration: InputDecoration(
                    labelText: 'Answer 3',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                )),
                Checkbox(
                  onChanged: (v) {
                    ch3 = v!;
                    setState(() {});
                  },
                  value: ch3,
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 8, left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        PostulerAnswerAPI postulerAnswerAPI = PostulerAnswerAPI();

                        postulerAnswerAPI.offreId= widget.offre.id.toString();
                        postulerAnswerAPI.answerId= _listAnswerOffre_Model!.answers![pos].id.toString();
                        postulerAnswerAPI.post({
                          "valid": "1",
                        }).then((value) {

        setState(() {});
    });

                      },
                      child: Text(
                        'Valider',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 8, left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        pos = pos + 1;
                        getq(
                            offreId: widget.offre.id.toString(),
                            questionId: _questionOffre_Model!
                                .questionOffre![pos].id
                                .toString());
                      },
                      child: Text(
                        'suivant',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  getq({required String offreId, String? questionId}) {
    ListQuesAPI questionOfrreAPI = ListQuesAPI();
    questionOfrreAPI.offreId = offreId;
    print("09" * 20);

    print(questionOfrreAPI.apiUrl());

    print("09" * 20);
    questionOfrreAPI.getData().then((value) {
      _questionOffre_Model = value as ListQuestionOffre_Model;

      q1.text = "${_questionOffre_Model?.questionOffre?[pos].content}";

      ListAnswereAPI listanswerOfrreAPI = ListAnswereAPI();
      listanswerOfrreAPI.offreId = offreId;
      listanswerOfrreAPI.questionId =
          _questionOffre_Model!.questionOffre![pos].id.toString();
      print("0listanswerOfrreAPI" * 20);

      print(listanswerOfrreAPI.apiUrl());

      print("0listanswerOfrreAPI" * 20);
      listanswerOfrreAPI.getData().then((value) {
        _listAnswerOffre_Model = value as ListAnswerOffre_Model;

        ans1.text = "${_listAnswerOffre_Model?.answers?[0].content}";
        ans2.text = "${_listAnswerOffre_Model?.answers?[1].content}";

        ans3.text = "${_listAnswerOffre_Model?.answers?[2].content}";

        setState(() {});

      });
    });
  }
}
