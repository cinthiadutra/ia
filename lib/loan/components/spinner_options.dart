// ignore_for_file: library_private_types_in_public_api

import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

class ContainerWithSpinner extends StatefulWidget {
  const ContainerWithSpinner({super.key});

  @override
  _ContainerWithSpinnerState createState() => _ContainerWithSpinnerState();
}

class _ContainerWithSpinnerState extends State<ContainerWithSpinner> {
  String _selectedOption = 'Filtros'; // Opção padrão selecionada

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Informação do cliente",
          style: Styles.textForm,
        ),
        BKOpenSpacing.x8,
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: BKOpenColors.borderGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(_selectedOption, style: Styles.textForm),
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () => _showOptions(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text('Filtros'),
              onTap: () {
                setState(() {
                  _selectedOption = 'Filtros';
                });
                Navigator.pop(context); // Fecha o modal após selecionar
              },
            ),
            ListTile(
              title: Text('Opção 2'),
              onTap: () {
                setState(() {
                  _selectedOption = 'Opção 2';
                });
                Navigator.pop(context); // Fecha o modal após selecionar
              },
            ),
            ListTile(
              title: Text('Opção 3'),
              onTap: () {
                setState(() {
                  _selectedOption = 'Opção 3';
                });
                Navigator.pop(context); // Fecha o modal após selecionar
              },
            ),
          ],
        );
      },
    );
  }
}
