import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../api_models/inscript_candi_model.dart';
import '../request/inscrit_candi_api.dart';
import 'delayed_animation.dart';
import 'package:app_flutter_memoir/page/test.dart';
import 'package:http/http.dart' as http;

//import 'package:file_picker/file_picker.dart';
//import 'package:open_file/open_file.dart';

class Inscription extends StatelessWidget {
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController AdresseController = TextEditingController();
  TextEditingController VilleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1).withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(
                    delay: 1500,
                    child: Text(
                      "create you account !",
                    ),
                  ),
                ],
              ),
            ),

            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your FirstName';
                  }
                  return null;
                },
                controller: FirstNameController,
                decoration: InputDecoration(
                  labelText: 'FirstName',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your LastName';
                  }
                  return null;
                },
                controller: LastNameController,
                decoration: InputDecoration(
                  labelText: 'LastName',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
                controller: EmailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            DelayedAnimation(
              delay: 4500,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                controller: passwordController,
                // obscureText: _obscureText,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  labelText: 'mot de passe',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      /* setState(() {
                    _obscureText = !_obscureText;
                  });*/
                    },
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your adresse';
                  }
                  return null;
                },
                controller: AdresseController,
                decoration: InputDecoration(
                  labelText: 'Adresse',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
                controller: cityController,
                decoration: InputDecoration(
                  labelText: 'ville',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date';
                  }
                  return null;
                },
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Date de naissance',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 3500,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your gender';
                  }
                  return null;
                },
                controller: genderController,
                decoration: InputDecoration(
                  labelText: 'gender',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            DelayedAnimation(
              delay: 5500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 28, 13, 248),
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'importer cv',
                ),
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );
                  if (result == null) {
                    return;
                  }
                  final file = result.files.first;
                  print(file.name);
                },
              ),
            ),
            SizedBox(height: 35),
            // LoginForm(),
            SizedBox(height: 125),
            DelayedAnimation(
              delay: 5500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 243, 13, 193),
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'valider',
                  /* style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),*/
                ),
                onPressed: () async {
                  InsCAPI insCAPI = InsCAPI();
                  insCAPI.post({
                    "email": EmailController.text,
                    "password": passwordController.text,
                    "firstName": FirstNameController.text,
                    "lastName": LastNameController.text,
                    "address": AdresseController.text,
                    "birthDate": dateController.text,
                    "gender": genderController.text,
                    "city": cityController.text,
                    "role": "candidat",
                    "cv": "",
                    "company": "",
                    "modePaiment": "",
                    "début": "",
                    "fin": ""
                  }).then((value) {
                    ///   InscriptCandiModel inscriptCandiModel =
                    ////     InscriptCandiModel();
                    //    inscriptCandiModel = value as InscriptCandiModel;
                    print(value);
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => test(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}*/

/*class _LoginFormState extends State<LoginForm> {
  var _obscureText = true;
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController AdresseController = TextEditingController();
  TextEditingController VilleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(children: []),
    );
  }
}*/
