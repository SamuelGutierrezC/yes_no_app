import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  //Se crea instancia(objeto) de la clase Dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async {
    //almacenar la petición GET en una variable
    final response = await _dio.get('https://yesno.wtf/api');

    //provocar o generar un error
    throw UnimplementedError();
  }
}