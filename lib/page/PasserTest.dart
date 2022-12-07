import 'package:app_flutter_memoir/api_models/Offre_Models/AddOffreQuestion_Model.dart';
import 'package:flutter/material.dart';

import '../../request/offres_req/AddOffre_Question_api.dart';
import '../../request/offres_req/AddOffre_Question_api.dart';
import '../../request/offres_req/AddoffresAnswer_api.dart';
import '../api_models/Test_Models/Quiz_questionModel.dart';
import '../api_models/Test_Models/quiz-answer_Model.dart';
import '../request/Test_gratuit_req/Quiz_Answer_api.dart';
import '../request/Test_gratuit_req/Quiz_Question_api.dart';
import '../save/save.dart';

class PasserTest extends StatefulWidget {
  const PasserTest({Key? key}) : super(key: key);

  @override
  State<PasserTest> createState() => _PasserTestState();
}

class _PasserTestState extends State<PasserTest> {
  Quiz_questionModel? _quiz_questionModel;
  Quiz_answerModel? _quiz_answerModel;
  @override
  void initState() {
    super.initState();
    Quiz_QuestionAPI quiz_QuestionAPI = Quiz_QuestionAPI();
    quiz_QuestionAPI.questionId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();
    quiz_QuestionAPI.getData().then((value) {
      _quiz_questionModel = value as Quiz_questionModel;

      q1.text = _quiz_questionModel!.content!;
    });
    Quiz_answerAPI quiz_answerAPI = Quiz_answerAPI();
    quiz_answerAPI.testId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();

    quiz_answerAPI.getData().then((value) {
      _quiz_answerModel = value as Quiz_answerModel;

      ans1.text = "${_quiz_answerModel!.answer?[0].content}";
      ans2.text = "${_quiz_answerModel!.answer?[1].content}";

      ans3.text = "${_quiz_answerModel!.answer?[2].content}";
    });
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
              Padding(
                padding:
                    EdgeInsets.only(top: 15, bottom: 8, left: 120, right: 10),
                child: ElevatedButton(
                  onPressed: () {},
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
            ],
          ),
        ));
  }
}
