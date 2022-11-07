import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class LoginModel extends AbstractJsonResource {
  String? message;
  User? user;
  String? token;

  LoginModel({this.message, this.user, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? birthDate;
  String? gender;
  String? role;
  String? email;
  int? emailVerified;
  String? cv;
  String? photo;
  String? company;
  Null? modePaiment;
  String? linkedin;
  Null? twitter;
  Null? dBut;
  Null? fin;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.address,
      this.city,
      this.birthDate,
      this.gender,
      this.role,
      this.email,
      this.emailVerified,
      this.cv,
      this.photo,
      this.company,
      this.modePaiment,
      this.linkedin,
      this.twitter,
      this.dBut,
      this.fin,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    address = json['address'];
    city = json['city'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    role = json['role'];
    email = json['email'];
    emailVerified = json['email_verified'];
    cv = json['cv'];
    photo = json['photo'];
    company = json['company'];
    modePaiment = json['modePaiment'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    dBut = json['début'];
    fin = json['fin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['email'] = this.email;
    data['email_verified'] = this.emailVerified;
    data['cv'] = this.cv;
    data['photo'] = this.photo;
    data['company'] = this.company;
    data['modePaiment'] = this.modePaiment;
    data['linkedin'] = this.linkedin;
    data['twitter'] = this.twitter;
    data['début'] = this.dBut;
    data['fin'] = this.fin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
