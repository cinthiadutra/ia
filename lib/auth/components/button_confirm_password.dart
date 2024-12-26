import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

class ButtonConfirmPassword extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonConfirmPassword({super.key, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
         backgroundColor: BKOpenColors.primary, // Cor de fundo do botão
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Borda arredondada
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style:Styles.buttonLabel.copyWith(color: BKOpenColors.white)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.sync_lock_outlined), // Ícone à direita
            ),
          ],
        ),
      ),
    );
  }
}
