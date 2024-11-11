//El modelo define qué datos debe
//tener la aplicación. Investigar patrón de diseño de software
//MVC: Modelo = información.
//Vista: Lo que vemos. Controlador: cómo va a funcionar

import 'package:yes_no_app_rodrigo_4sa/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() => Message(
      //Condicional ternario para darle valor a los mensajes kevin, jesús, samx2, angela, luis, gasca
      text: answer == 'yes'
          ? 'Sí'
          : answer == 'no'
              ? 'No'
              : 'Quizás',
      //Siempre va a ser de ella
      fromWho: FromWho.hers,
      //Será el gif
      imageUrl: image);
}
