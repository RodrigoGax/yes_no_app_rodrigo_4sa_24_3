//El modelo define qué datos debe
//tener la aplicación. Investigar patrón de diseño de software
//MVC: Modelo = información.
//Vista: Lo que vemos. Controlador: cómo va a funcionar

class YesNoModel {
  //Atributos de clase
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});
}
