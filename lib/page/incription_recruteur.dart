import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:date_range_form_field/date_range_form_field.dart';
//import 'package:date/date.dart';
import 'package:intl/intl.dart';
import 'package:app_flutter_memoir/page/modalite_pai.dart';

import '../request/inscrit_candi_api.dart';
import 'delayed_animation.dart';
import 'package:http/http.dart' as http;

class Inscription_recuteur extends StatelessWidget {
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
  TextEditingController EntrepriseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
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
                      /* style: GoogleFonts.poppins(
                        color: d_red,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),*/
                    ),
                  ),
                  DelayedAnimation(
                    delay: 3500,
                    child: TextField(
                      controller: FirstNameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  DelayedAnimation(
                    delay: 3500,
                    child: TextField(
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
                    child: TextField(
                      controller: EmailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  DelayedAnimation(
                    delay: 3500,
                    child: TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                        labelText: 'Date de naissance',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  DelayedAnimation(
                    delay: 4500,
                    child: TextField(
                      controller: passwordController,
                      obscureText: _obscureText,
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
                            _obscureText = !_obscureText;
                          },
                        ),
                      ),
                    ),
                  ),
                  DelayedAnimation(
                    delay: 3500,
                    child: TextField(
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
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        labelText: 'Ville',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  DelayedAnimation(
                    delay: 3500,
                    child: TextField(
                      controller: EntrepriseController,
                      decoration: InputDecoration(
                        labelText: 'Entreprise',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  DelayedAnimation(
                    delay: 3500,
                    child: TextField(
                      controller: genderController,
                      decoration: InputDecoration(
                        labelText: 'gender',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            // recruForm(),
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
                    "role": "recruteur",
                    "cv": "",
                    "company": "",
                    "modePaiment": "stripe",
                    "début": "2022-10-05",
                    "fin": "2022-12-31"
                  }).then((value) {
                    ///   InscriptCandiModel inscriptCandiModel =
                    ////     InscriptCandiModel();
                    //    inscriptCandiModel = value as InscriptCandiModel;
                    print(value);
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => modalite_pai(),
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
