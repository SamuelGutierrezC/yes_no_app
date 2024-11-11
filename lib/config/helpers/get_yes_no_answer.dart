import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //Se crea instancia(objeto) de la clase Dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async {
    //almacenar la petición GET en una variable
    final response = await _dio.get('https://yesno.wtf/api');

    //almanecar la data de la respuesta en una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //Devolver la instancia de "Message" creada en el modelo
    return yesNoModel.toMessageEntity();
  }
}