import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Como enviar seu documento",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Instrução de envio",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  BKOpenSpacing.x4,
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Instrução de envio",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  BKOpenSpacing.x4,
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Instrução de envio",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  BKOpenSpacing.x4,
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Instrução de envio",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  BKOpenSpacing.x16,
                  BKOpenButton(
                    text: "Enviar foto/arquivo",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
