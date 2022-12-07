import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'Add_test.dart';
import '../delayed_animation.dart';
import '../../request/offres_req/Add_Offre_request.dart';
import '../../request/offres_req/offre-api.dart';
import 'Add_test.dart';
import 'package:http_parser/http_parser.dart';
//import 'package:file_picker/file_picker.dart';
//import 'package:open_file/open_file.dart';

class AjoutOffre extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController tempsController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categorieController = TextEditingController();
  TextEditingController logoController = TextEditingController();
  File? image;
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
                      "Ajouter un offre d'emploi !",
                      /* style: GoogleFonts.poppins(
                        color: d_red,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),*/
                    ),
                  ),
                  DelayedAnimation(
                    delay: 3500,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name post';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Nom de l offre',
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
                          return 'Please enter adresse';
                        }
                        return null;
                      },
                      controller: addressController,
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
                          return 'Please enter number phone';
                        }
                        return null;
                      },
                      controller: telefoneController,
                      decoration: InputDecoration(
                        labelText: 'Numéro de téléphone',
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
                          return 'Please enter catégorie';
                        }
                        return null;
                      },
                      controller: categorieController,
                      decoration: InputDecoration(
                        labelText: 'Catégorie',
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
                          return 'Please enter description';
                        }
                        return null;
                      },
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
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
                          return 'Please enter time';
                        }
                        return null;
                      },
                      controller: tempsController,
                      decoration: InputDecoration(
                        labelText: 'Temps',
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
                          return 'Please enter time';
                        }
                        return null;
                      },
                      controller: logoController,
                      decoration: InputDecoration(
                        labelText: 'Logo',
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
                        'Logo',
                      ),
                      onPressed: () async {
                        final picker = ImagePicker();
                        XFile? img =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (img != null) {
                          image = File(img.path);
                          print(image!.path);
                        }
                      },
                    ),
                  ),
                ],
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
                  'suivant',
                  /* style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),*/
                ),
                onPressed: () async {
                  Add_OffreAPI add_OffreAPI = Add_OffreAPI();

                  // String fileName = image!.path.split('/').last;
                  add_OffreAPI.post({
                    "name": nameController.text,
                    "address": addressController.text,
                    "telefone": telefoneController.text,
                    "description": descriptionController.text,
                    "categorie": categorieController.text,
                    "temps": tempsController.text,
                    "logo": logoController.text,
                    /* await MultipartFile.fromFile(image!.path,
                        filename: fileName,
                        contentType: new MediaType('image', 'png')),*/
                    "user_id": "",
                    "updated_at": "",
                    "created_at": "",
                    "id": ""
                  }).then((value) {
                    print(value);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTest(),
                    ),
                  );
                  /* await http.post(
                      Uri.parse('http://localhost:8000/api/users/create/'),
                      body: {
                        "Role": "client",
                        // "first_name": widget.email.password
                      });*/
                },
              ),
            ),
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: DelayedAnimation(
                    delay: 6500,
                    child: Text(
                      "SKIP",
                      /*style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),*/
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
