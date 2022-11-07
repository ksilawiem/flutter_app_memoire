import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class InscriptCandiModel extends AbstractJsonResource {
  String? message;
  User? user;

  InscriptCandiModel({this.message, this.user});

  InscriptCandiModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? birthDate;
  String? gender;
  String? role;
  String? email;
  String? cv;
  String? company;
  Null? modePaiment;
  Null? dBut;
  Null? fin;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.firstName,
      this.lastName,
      this.address,
      this.city,
      this.birthDate,
      this.gender,
      this.role,
      this.email,
      this.cv,
      this.company,
      this.modePaiment,
      this.dBut,
      this.fin,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    address = json['address'];
    city = json['city'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    role = json['role'];
    email = json['email'];
    cv = json['cv'];
    company = json['company'];
    modePaiment = json['modePaiment'];
    dBut = json['début'];
    fin = json['fin'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['email'] = this.email;
    data['cv'] = this.cv;
    data['company'] = this.company;
    data['modePaiment'] = this.modePaiment;
    data['début'] = this.dBut;
    data['fin'] = this.fin;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
