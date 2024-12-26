import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:flutter/material.dart';

class Styles {
  static const h1 =
      TextStyle(fontFamily: 'inter', fontWeight: FontWeight.bold, fontSize: 32);

  static const h2 = TextStyle(
      fontFamily: 'inter',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: BKOpenColors.primary);

  static const h2Strong =
      TextStyle(fontFamily: 'inter', fontSize: 22, fontWeight: FontWeight.w700);

  static const h3 = TextStyle(
      fontFamily: 'inter', fontSize: 20, color: BKOpenColors.blackTitulo);

  static const subheading =
      TextStyle(fontFamily: 'inter', fontWeight: FontWeight.bold, fontSize: 20);

  static const h3Strong = TextStyle(
      fontFamily: 'inter',
      fontSize: 18,
      color: BKOpenColors.blackSub,
      fontWeight: FontWeight.w700);

  static const h3Titulo = TextStyle(
      fontFamily: 'inter',
      fontSize: 18,
      color: BKOpenColors.primary,
      fontWeight: FontWeight.w700);

  static const h3Label = TextStyle(
      fontFamily: 'inter',
      fontSize: 18,
      color: BKOpenColors.white,
      fontWeight: FontWeight.w400);

  static const h4 = TextStyle(
      fontFamily: 'inter',
      fontSize: 16,
      color: BKOpenColors.blackTitulo,
      fontWeight: FontWeight.w700);

  static const body = TextStyle(fontFamily: 'inter', fontSize: 16);

  static const TextStyle oauthButtonLabel = TextStyle(
    fontFamily: 'inter',
    fontSize: 16,
    letterSpacing: 0.26,
    color: BKOpenColors.white,
  );

  static const TextStyle textInput = TextStyle(
      fontSize: 14, color: BKOpenColors.darkGrey, fontWeight: FontWeight.w400);
  static const TextStyle textHint = TextStyle(
      fontSize: 14, color: BKOpenColors.greyHint, fontWeight: FontWeight.w400);

  static const TextStyle buttonLabel = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: BKOpenColors.secondary,
      fontFamily: 'inter');

  static const TextStyle helperText = TextStyle(
      fontSize: 14, fontFamily: 'inter', color: BKOpenColors.secondary);

  static const TextStyle bodyText = TextStyle(
      fontSize: 14,
      fontFamily: 'inter',
      color: BKOpenColors.blackSub,
      fontWeight: FontWeight.w400);

  static const TextStyle labelText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'inter',
      color: BKOpenColors.hintTextForm);

  static const TextStyle labelStatusText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: 'inter',
      color: BKOpenColors.white);

  static const TextStyle textUnderline = TextStyle(
    fontSize: 14,
    color: BKOpenColors.darkGrey,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w700,
    fontFamily: 'inter',
  );
  static const TextStyle textDetailsBold = TextStyle(
    fontSize: 14,
    color: BKOpenColors.darkGrey,
    fontFamily: 'inter',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle textDetailsValor = TextStyle(
    fontSize: 14,
    color: BKOpenColors.secondary,
    fontFamily: 'inter',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle textDetailsTitle = TextStyle(
    fontSize: 14,
    color: BKOpenColors.blackTitulo,
    fontFamily: 'inter',
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textForm = TextStyle(
    fontSize: 12,
    color: BKOpenColors.primary,
    fontWeight: FontWeight.w700,
    fontFamily: 'inter',
  );
  // static const TextStyle textAll = TextStyle(
  //   fontSize: 12,
  //   color: BKOpenColors.blackSub,
  //   fontWeight: FontWeight.w700,
  //   fontFamily: 'inter',
  // );
  static const TextStyle subTextDetails = TextStyle(
    fontSize: 12,
    color: BKOpenColors.blackSub,
    fontWeight: FontWeight.w400,
    fontFamily: 'inter',
  );
  static const TextStyle subText = TextStyle(
    fontSize: 12,
    color: BKOpenColors.greyTitle2,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter',
  );

  static const TextStyle textDetails = TextStyle(
    fontSize: 12,
    color: BKOpenColors.hintTextForm,
    fontWeight: FontWeight.w400,
    fontFamily: 'inter',
  );
  // static const TextStyle subTextcard = TextStyle(
  //   fontSize: 12,
  //   color: BKOpenColors.white,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: 'inter',
  // );

  static const TextStyle labelSubtitlePopUp = TextStyle(
    fontSize: 11,
    color: BKOpenColors.greyTitleTab,
    fontFamily: 'inter',
    fontWeight: FontWeight.normal,
  );

  static const TextStyle navbarLabel = TextStyle(
      fontSize: 14,
      height: 15 / 11,
      color: BKOpenColors.greyTitleTab,
      fontWeight: FontWeight.w700);

  static const TextStyle helperTextError = TextStyle(
    fontSize: 10,
    color: BKOpenColors.accentRed,
  );
}
