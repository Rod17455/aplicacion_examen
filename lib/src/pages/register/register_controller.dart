import 'package:aplicacion_examen/src/providers/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user.dart';

class RegisterController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rfcController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserProvider userProvider = UserProvider();

  void register() async {
    String name = nameController.text;
    String email = emailController.text.trim();
    String rfc = rfcController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(email, name, rfc, password, confirmPassword)) {

      User user = User(
        nombre:name,
        email:email,
        rfc:rfc,
        password:password
      );

      Response response = await userProvider.create(user);

      print('Response: ${response.body}');

      Get.snackbar('Formulario valido', 'Estas listo para enviar la peticion Http');
    }
  }

  bool isValidForm(
      String email,
      String name,
      String rfc,
      String password,
      String confirmPassword
  ) {

    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (name.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar tu nombre');
      return false;
    }
    
    //Validar RFC
    if (rfc.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar tu RFC');
      return false;
    } else {
      RegExp rfcRegex = RegExp(r'^[A-Z]{3,4}[0-9]{2}([0-9]{2}|[A-Z]{1})([0-9A-Z]{3})$');
      int length = rfc.length;

      if (!rfcRegex.hasMatch(rfc) && length != 13) {
        Get.snackbar('Formulario no valido', 'RFC invalido');
        return false;
      } 

    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el password');
      return false;
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar la confirmacion del password');
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Formulario no valido', 'los password no coinciden');
      return false;
    }

    return true;
  }

}