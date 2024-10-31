import 'package:dio/dio.dart';
import 'package:yes_no_app_rodrigo_4sa/domain/entities/message.dart';

class GetYesNoAnswer {
  //Se crea objeto de la clase Dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async {
    //Almacenar la petición GET en una variable
    final response = await _dio.get('https://yesno.wtf/api');

    //Generar el error
    throw UnimplementedError();
  }
}
