import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  final String _name;
  final String _surname;
  final String _email;
  final double _balance;
  final String _imageAsset;

  UserModel.singleton({
    required String name,
    required String surname,
    required String email,
    required double balance,
    required String imageAsset,
  })  : _name = name,
        _surname = surname,
        _email = email,
        _balance = balance,
        _imageAsset = imageAsset;

  static final UserModel user = UserModel.singleton(
    name: 'Dmitry',
    surname: 'Prudnyk',
    email: 'example@gmail.com',
    balance: 3200,
    imageAsset: 'images/men.jpg',
  );

  factory UserModel() {
    return UserModel.user;
  }

  String get name => _name;
  String get surname => _surname;
  String get email => _email;
  double get balance => _balance;
  String get imageAsset => _imageAsset;
}
