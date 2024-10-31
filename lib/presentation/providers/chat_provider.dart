import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  
  List<Message> messageList = [
    Message(text: 'Hola tilin', fromWho: FromWho.me),
    Message(text: 'lloras porque reprobaste TAP?', fromWho: FromWho.me)
  ];
  //Controlador para manerar la posición del scroll
  final ScrollController chatScrollController = ScrollController();

  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    //El mensaje siempre va a ser 'me' porque yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
    //Notifica si algo de provider cambió para que se guarde en el
    notifyListeners();
    //Mueve el Scroll
    moveScrollToBottom();
  }
//Future es una promesa
//get es para que el servidor me diga/obtenga algo
//dio es un paquete de flutter para manejar peticiones http



    //Mover el scroll al ultimo mensaje
    Future<void> moveScrollToBottom() async{
    //Un pequeño atraso en la animación para garantizar que siempre se verá aun cuando se envien
    //mensajes cortos y rápidos
      await Future.delayed(const Duration(seconds: 1));
      //Extender el scroll lo máximo que se pueda, offset: posición de la animación
      //maxScrollExtent: determina a lo máximo que el scroll puede dar
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent, 
        duration: const Duration(milliseconds: 300), 
        curve: Curves.easeOut);
    }
  }

