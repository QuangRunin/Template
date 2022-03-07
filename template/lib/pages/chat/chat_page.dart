import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:template/common/styles.dart';
import 'package:template/components/custom_appbar.dart';
import 'package:template/pages/chat/chat_controller.dart';
class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Name',
      ),
      body: GetBuilder<ChatController>(builder: (controller) {
        return Column(
          children: [
            const Expanded(
              child: SizedBox(
                child: SingleChildScrollView(

                ),
              ),
            ),
            Container(
              height: 50,
              color: Colors.red,
              child: TextField(
                readOnly: false,
                autofocus: false,
                textAlignVertical: TextAlignVertical.top,
                style: size14W500Default,
                keyboardType: TextInputType.multiline,
                onChanged: (value) => {},
                decoration: InputDecoration.collapsed(
                  hintText: '...',
                  hintStyle: hintText,
                ),
              ),
            ),
          ],
        );
      },),
    );
  }
}
