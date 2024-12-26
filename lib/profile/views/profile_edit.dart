// ignore_for_file: deprecated_member_use

import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/components/utils/formatter_class.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/app/widgets/text_inputs/complex_text_input.dart';
import 'package:bkopen/profile/components/dropdown_custom.dart';
import 'package:bkopen/profile/controllers/profile_controller.dart';
import 'package:bkopen/profile/data/models/co_culture_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BKAppBar(
        label: 'Editar Dados',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(() {
          // Aguardando os dados serem carregados
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          // Se os dados já foram carregados
          return ListView(
            children: [
              // Campo Nome
              ComplexTextInput(
                textCampo: 'Nome',
                textEditingController: controller.nameController,
                onChanged: (value) {
                  controller.appController.couser.update((user) {
                    user?.name = value;
                  });
                  controller.nameController.text = value;
                },
              ),
              BKOpenSpacing.x16,

              // Campo Apelido
              ComplexTextInput(
                textCampo: 'Sobrenome',
                textEditingController: controller.lastnameController,
                onChanged: (value) {
                  controller.appController.couser.update((user) {
                    user?.lastName = value;
                  });
                  controller.lastnameController.text = value;
                },
              ),
              BKOpenSpacing.x16,

              // Campo E-mail (somente leitura)
              TextFormField(
                initialValue:
                    controller.appController.couser.value.email,
                decoration: InputDecoration(border: OutlineInputBorder()),
                enabled: false, // Tornar o campo não editável
              ),
              BKOpenSpacing.x16,

              // Campo Telefone (somente leitura)
              TextFormField(
                initialValue:
                    controller.appController.couser.value.cellPhone,
                decoration: InputDecoration(border: OutlineInputBorder()),
                enabled: false,
                // Tornar o campo não editável
              ),
              BKOpenSpacing.x16,

              // // Dropdown Personalidade
              // DropdownCustom(
              //   list: controller.listPersonality,
              //   selected: controller.personality,
              //   title: 'Personalidade',
              //   getLabel: (value) => value.toString(),
              //   onSelected: (newValue) {
              //     controller.personality.text = newValue.toString();
              //   },
              // ),
              // BKOpenSpacing.x16,

              // Campo Documento
              ComplexTextInput(
                textCampo: 'Documento',
                textEditingController: controller.docController,
                onChanged: (value) {
                  controller.appController.couser.update((user) {
                    user?.legalDocument = value;
                  });
                  controller.docController.text = value;
                },
                inputFormatters: [CpfInputFormatter()],
              ),
              BKOpenSpacing.x16,

              // Campo Data de Nascimento
              ComplexTextInput(
                textCampo: 'Data de nascimento',
                textEditingController: controller.birthController,
                inputFormatters: [DateInputFormatter()],
                onChanged: (value) {
                  // Validar se a string é uma data válida ou aplicar o formato desejado
                  if (value.isNotEmpty) {
                    // Exemplo de validação simples, você pode usar regex ou outras lógicas para validar o formato
                    controller.appController.couser.update((user) {
                      user?.birth = value;
                    });
                    controller.birthController.text = value;
                  }
                },
              ),
              BKOpenSpacing.x16,

              // Dropdown País
              DropdownCustom<CoCultureDto>(
                list: controller.appController.listCountry,
                selected: controller.countrySelected,
                getLabel: (CoCultureDto culture) => culture.name ?? '-',
                title: 'País',
                onSelected: (CoCultureDto? newCountry) {
                  controller.selectPais.value = newCountry?.id ?? 1;
                },
              ),
              BKOpenSpacing.x16,

              // Botão de salvar alterações
              BKOpenButton(
                onTap: () {
                  controller.username.value =
                      controller.appController.couser.value.email ?? '';
                  controller.up();
                },
                text: 'Atualizar dados ',
                imageRight: SvgPicture.asset(
                  'assets/images/svg/person_edit.svg',
                  color: BKOpenColors.white,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
