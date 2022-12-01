import 'package:app_flutter_memoir/api_models/Offre_Models/AddOffreQuestion_Model.dart';
import 'package:flutter/material.dart';

import '../request/offres_req/AddOffre_Question_api.dart';
import '../request/offres_req/AddoffresAnswer_api.dart';

class AddTest extends StatefulWidget {
  const AddTest({Key? key}) : super(key: key);

  @override
  State<AddTest> createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  AddOffreQuestionModel? _addOffreQuestionModel;
  @override
  void initState() {
    super.initState();
    print("Add_OffreQuestion_API");
    Add_OffreQuestion_API add_OffreQuestion_API = Add_OffreQuestion_API();
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
        appBar: AppBar(title: Text('Add Question')),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: q1,
                decoration: InputDecoration(
                  labelText: 'Entrer Question',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your question';
                  }
                  return null;
                },
              ),
              Row(children: [
                Expanded(
                    child: TextFormField(
                  controller: ans1,
                  decoration: InputDecoration(
                    labelText: 'Answer 1',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter answer';
                    }
                    return null;
                  },
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
                    child: TextFormField(
                  controller: ans2,
                  decoration: InputDecoration(
                    labelText: 'Answer 2',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter answer';
                    }
                    return null;
                  },
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
                    child: TextFormField(
                  controller: ans3,
                  decoration: InputDecoration(
                    labelText: 'Answer 3',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter answer';
                    }
                    return null;
                  },
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
                  onPressed: () {
                    Add_OffreQuestion_API add_offreQuestion_API =
                        Add_OffreQuestion_API();
                    add_offreQuestion_API.offreId = "";
                    Map<String, dynamic> data = {"q": q1.text};
                    add_offreQuestion_API.post(data).then((value) {
                      AddOffreQuestionModel v = value as AddOffreQuestionModel;

                      Add_OffreAnswerAPI add_offreAnswerAPI =
                          Add_OffreAnswerAPI();

                      add_offreAnswerAPI.offreId = "";
                      add_offreAnswerAPI.questionId = v.question!.id.toString();
                      Map<String, dynamic> data2 = {
                        "ans": {"an1": ans1.text, "v": true},
                      };

                      add_offreAnswerAPI.post(data2).then((value) {});
                    }); // Validate returns true if th.e form is valid, or false otherwise.
                    /* if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }*/
                  },
                  child: Text(
                    'submit',
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
