import 'package:bkopen/ProposalsAndContracts/controllers/proposal_against_controller.dart';
import 'package:bkopen/ProposalsAndContracts/models/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildMessage extends GetView<ProposalAgainstController> {
 final Message message;
   
    const BuildMessage({super.key,  required this.message});
   
   @override
   Widget build(BuildContext context) {
  final isUser = message.sender == 'Usuário';

       return Container(
    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Column(
      crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isUser ? Colors.grey[300] : null,
            border:
                Border.all(color: isUser ? Colors.transparent : Colors.grey),
            borderRadius: isUser
                ? BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(isUser ? 16.0 : 0.0),
                    bottomRight: Radius.circular(isUser ? 0.0 : 16.0),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                    bottomRight: Radius.circular(isUser ? 16.0 : 0.0),
                    bottomLeft: Radius.circular(isUser ? 0.0 : 16.0),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message.text),
              SizedBox(height: 4.0),
              Text(
                'Enviado ${DateTime.now().hour}:${DateTime.now().minute}',
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}}