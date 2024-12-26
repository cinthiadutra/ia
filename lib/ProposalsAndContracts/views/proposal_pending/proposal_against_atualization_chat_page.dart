//import 'package:bkopen/proposal_pending%20%20/controllers/proposal_against_atualization_option_controller.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/ProposalsAndContracts/controllers/proposal_against_controller.dart';
import 'package:bkopen/ProposalsAndContracts/components/build_message.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import '../../../app/spacing/bkopen_spacing.dart';

class ProposalAgainstAtualizationChatPage
    extends GetView<ProposalAgainstController> {
  const ProposalAgainstAtualizationChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(label: "Home Equity"),
        body: Obx(() {
        
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BKOpenSpacing.x24,
                  BKOpenSpacing.x24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chat',
                        style: Styles.h4,
                      ),
                      TextButton(
                          onPressed: () {
                            controller.isShow.value = !controller.isShow.value;
                          },
                          child: Row(
                            children: [
                              Text(
                                !controller.isShow.value
                                    ? 'Mostrar chat'
                                    : 'Ocultar chat',
                                style: Styles.textUnderline,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                !controller.isShow.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: BKOpenColors.blackSub,
                                size: 20,
                              )
                            ],
                          ))
                    ],
                  ),
                  Visibility(
                    visible: controller.isShow.value,
                    child: GetBuilder<ProposalAgainstController>(
                      init: controller,
                      initState: (_) {},
                      builder: (_) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: controller.mensagens.length,
                            itemBuilder: (context, index) {
                              return BuildMessage(
                                  message: controller.mensagens[index]);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    margin: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Form(
                              key: controller.formKey,
                              child: TextFormField(
                                controller: controller.message,
                                onChanged: (text) {
                                  controller.mensagemEnviada.value = text;
                                  controller.isTyping.value = text.isNotEmpty;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Digite sua mensagem...',
                                  border: InputBorder.none,
                                ),
                                validator: Validatorless.required(
                                    'Insira uma Mensagem'),
                              ),
                            ),
                          ),
                        ),
                        Obx(() => IconButton(
                            onPressed: controller.isTyping.value
                                ? () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller
                                          .sendMessage(controller.message.text);
                                      controller.message.clear();
                                      controller.update();
                                    }
                                  }
                                : null,
                            icon: Icon(Icons.send),
                            color: BKOpenColors.secondary)),
                      ],
                    ),
                  )
                ],
              ),
            );
          
        }),
      ),
    );
  }
}
