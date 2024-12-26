// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/loan/data/models/co_dynamic_attribute_dto.dart';
import 'package:flutter/material.dart';
import 'package:search_cep/search_cep.dart';
import 'package:validatorless/validatorless.dart';

class CepAutocompleteField extends StatefulWidget {
  final CoDynamicAttributeDTO? attribute;
  final String textCampo;

  const CepAutocompleteField(
      {super.key,
      required this.attribute,
      required this.textCampo}); // Corrigido o construtor

  @override
  _CepAutocompleteFieldState createState() => _CepAutocompleteFieldState();
}

class _CepAutocompleteFieldState extends State<CepAutocompleteField> {
  final TextEditingController _cepController = TextEditingController();
  String? _addressInfo; // Armazena informações completas do endereço
  String? _csMunicipio; // Armazena o município
  String? _csEstado;

  Future<void> _searchCep(String cep) async {
    final viaCepSearchCep = ViaCepSearchCep();
    final response = await viaCepSearchCep.searchInfoByCep(cep: cep);

    setState(() {
      response.fold(
        (failure) {
          _addressInfo = 'Erro ao buscar CEP';
        },
        (info) {
          // Salva cidade e estado
          _csMunicipio = info.localidade;
          _csEstado = info.uf;
          // Exibe informações completas
          _addressInfo =
              '${info.logradouro}, ${info.bairro}, ${info.localidade}, ${info.uf}';
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textCampo,
          style: Styles.textForm,
        ),
        BKOpenSpacing.x8,
        TextFormField(
          validator: Validatorless.required('Digite o cep'),
          controller: _cepController,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            hintText: 'Digite o CEP',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            if (value.length == 8) {
              _searchCep(value);
            } else if (_addressInfo != null) {
              setState(() {
                _addressInfo = null; // Limpa o endereço se o CEP for apagado
              });
            }
            // Atualiza o valor de 'attribute'
            widget.attribute?.value = _cepController.text;
            widget.attribute?.changed = true; 
          },
          onEditingComplete: () {
            FocusScope.of(context).unfocus(); // Fecha o teclado
            if (_csMunicipio != null && _csEstado != null) {
              // Salva os valores ou realiza outras ações com CS_MUNICIPIO e CS_ESTADO
              log("CS_MUNICIPIO: $_csMunicipio");
              log("CS_ESTADO: $_csEstado");
              // Aqui, você pode enviar os valores para o backend ou atualizar um model
            }
          },
        ),
        const SizedBox(height: 10),
        if (_addressInfo != null)
          Text(
            _addressInfo!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }
}
