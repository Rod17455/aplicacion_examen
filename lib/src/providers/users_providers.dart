import 'package:aplicacion_examen/src/environment/environment.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class UserProvider extends GetConnect {
  String url = Environment.API_URL + 'api/users';

  Future<Response> create(User user) async{
    print('JSON ENVIADO: ${user.toJson()}');
    Response response = await post(
      '$url/create', 
       user.toJson(),
       headers: {
        'Content-Type':'application/json'
       }
    );

    return response;
  }

  /*
  Future<Response> create(User user) async{
    print('JSON ENVIADO: ${user.toJson()}');
    Response response = await post(
      '$url/create', 
       user.toJson(),
       headers: {
        'Content-Type':'application/json'
       }
    );

    return response;
  }
  
   */


}