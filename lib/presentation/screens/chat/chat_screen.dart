import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_rodrigo_4sa/domain/entities/message.dart';
import 'package:yes_no_app_rodrigo_4sa/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_rodrigo_4sa/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_rodrigo_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_rodrigo_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                // 'https://i.pinimg.com/564x/14/1b/4e/141b4e3e08d9a134d97c1d135a482ce4.jpg'),
                'https://myket.ir/app-icon/76cbe69a-b0af-4d00-9ba5-7506bdd8282d.png'),
          ),
        ),
        title: const Text('Crush 🔥 ♥️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Pedirle al widget que esté pendiente de todos los cambios
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    //Enlaza al controlador creado en ChatProvider
                    controller: chatProvider.chatScrollController,
                    //Se pone la longitud de la lista que se encuentra en Chatprovider
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      //Instancia del message que sabrá de quién es el mensaje
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(
                              message: message,
                            )
                          : MyMessageBubble(
                              message: message,
                            );
                    })),

            /// Caja de texto de mensajes
            MessageFieldBox(
              //Una vez que tenga el valor cambiado, envíalo
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
