// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../app/theme/styles.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  bool valueVisible = false;

  void toggleVisibility() {
    setState(() {
      valueVisible = !valueVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Última proposta',style: Styles.labelText,),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: toggleVisibility,
                      child: Icon(Icons.visibility),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text('Home Equity',style: Styles.h3Strong,),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Mais Detalhes',style: Styles.bodyText,),
                      Icon(
                        Icons.navigate_next,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Estado jornada',style:Styles.labelText,),
                ),
                SizedBox(
                  height: 12,
                ),
                Stack(
                  children: [
                    Visibility(
                      visible: false,
                      child: Row(
                        children: [
                          Text('Valor: R\$ ', style: Styles.labelText),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: true,
                      child: Text('Valor: R\$ 8.000,00', style: Styles.labelText),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text('Data: 10/04/2024',style:Styles.labelText,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
