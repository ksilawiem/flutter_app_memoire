import 'package:app_flutter_memoir/api_models/Offre_Models/AddOffreQuestion_Model.dart';
import 'package:flutter/material.dart';

import '../request/offres_req/AddOffre_Question_api.dart';

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
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ListTile(
                  leading: Text("leading"),
                  title: Checkbox(
                    onChanged: (v) {},
                    value: true,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
