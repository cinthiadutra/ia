// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bkopen/loan/components/dialog_bkopen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:bkopen/ProposalsAndContracts/controllers/proposal_against_controller.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:get/get.dart';

class UploadPhoto extends StatelessWidget {
  final bool isPendent;
  final String? title;

  UploadPhoto({
    super.key,
    required this.isPendent, this.title,
  });
  final controller = Get.find<ProposalAgainstController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "Upload de arquivo",
              style: Styles.textForm,
            ),
            BKOpenSpacing.x8,
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(6),
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: SizedBox(
                  height: Get.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            controller.isImageSaved.value
                                ? Obx(() => SizedBox(
                                                                    width: 270,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.start,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.check_circle_outline,
                                                                                  color: BKOpenColors.highlight,
                                                                                  size: 15,
                                                                                ),
                                                                            BKOpenSpacing.x4,
                                                                                
                                                                                Text('Upload completo'),
                                                                              ],
                                                                            ),
                                                                            BKOpenSpacing.x2,
                                                                            BKOpenButton(
                                                                              height: 34,
                                                                              width: 111,
                                                                              text: 'Reenviar',
                                                                              onTap: () {
                                                                                showBKCustomDialog(controller, isPendent,()=> controller.pickFile(isPendent));
                                                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            width: 110,
                                            height: 100,
                                            child: Image.file(
                                              File(controller.imagePath.value),
                                              fit: BoxFit.contain,
                                            )),
                                      ],
                                    ),
                                  ))
                                : Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: Get.width * 0.020),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      BKOpenButton(
                                        width: 181,
                                        height: 34,
                                        text: 'Enviar foto/arquivo',
                                        onTap: () async {
                                          // controller.showInfoDialog(isPendent);
                                          showBKCustomDialog(controller, isPendent, ()=> controller.pickFile(isPendent));
                                        },
                                      ),
                                      BKOpenSpacing.x8,
                                      Column(
                                        children: [
                                          Text(
                                              'Formatos de arquivos suportados: ',
                                              style: Styles.textDetails
                                                  .copyWith(
                                                      color: BKOpenColors
                                                          .blackSub)),
                                          Text(
                                            'JPEG, PNG, PDF',
                                            style: Styles.textDetails
                                                .copyWith(
                                                    color: BKOpenColors
                                                        .highlight),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
