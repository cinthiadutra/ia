// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/bkopencolors.dart';
import '../../theme/styles.dart';

// ignore: must_be_immutable
class BKOpenButton extends StatelessWidget {
  Color backgroundColor;
  Color borderColor;
  Color textColor;
  String? text;
  Widget? image;
  Widget? imageLeft;
  Widget? imageRight;
  Function? onTap;
  bool enabled;
  double height;
  double? width;
  double? startMargin;
  TextStyle? textStyle;
  MainAxisAlignment mainAxisAlignment;
  MainAxisSize mainAxisSize;
  double imagePadding;
  double? widthBorder;

  /*  Construtor Geral */
  BKOpenButton({
    super.key,
    this.backgroundColor = BKOpenColors.primary,
    this.borderColor = BKOpenColors.primary,
    this.textColor = BKOpenColors.white,
    this.text,
    this.image,
    this.imageLeft,
    this.imageRight,
    this.enabled = true,
    this.onTap,
    this.height = 45,
    this.width,
    this.startMargin,
    this.textStyle,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.imagePadding = 5,
  });
  BKOpenButton.card({
    super.key,
    this.backgroundColor = BKOpenColors.primary,
    this.borderColor = BKOpenColors.primary,
    this.textColor = BKOpenColors.white,
    this.text,
    this.image,
    this.imageLeft,
    this.imageRight,
    this.enabled = true,
    this.onTap,
    this.height = 35,
    this.width,
    this.startMargin,
    this.textStyle = Styles.subTextDetails,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.mainAxisSize = MainAxisSize.max,
    this.imagePadding = 130,
  });
  /* Construtor do Facebook */
  BKOpenButton.facebook({
    super.key,
    this.backgroundColor = BKOpenColors.facebookBlue,
    this.borderColor = BKOpenColors.facebookBlue,
    this.textColor = BKOpenColors.white,
    this.text,
    this.image,
    this.imageLeft,
    this.imageRight,
    this.enabled = true,
    this.onTap,
    this.height = 45,
    this.width,
    this.startMargin,
    this.textStyle = Styles.oauthButtonLabel,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.imagePadding = 20,
  }) {
    imageLeft = enabled
        ? SvgPicture.asset('assets/images/ic_facebook.svg')
        : SvgPicture.asset('assets/images/ic_facebook.svg',
            color: BKOpenColors.white);
  }

  /* Construtor do Google */
  BKOpenButton.google({
    super.key,
    this.backgroundColor = BKOpenColors.white,
    this.borderColor = BKOpenColors.greyTitleTab,
    this.textColor = BKOpenColors.blackSub,
    this.text,
    this.image,
    this.imageLeft,
    this.imageRight,
    this.enabled = true,
    this.onTap,
    this.height = 45,
    this.width,
    this.startMargin,
    this.textStyle = Styles.oauthButtonLabel,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.imagePadding = 5,
  }) {
    imageLeft = enabled
        ? SvgPicture.asset('assets/images/ic_google.svg')
        : SvgPicture.asset('assets/images/ic_google.svg',
            color: BKOpenColors.white);
  }

  /* Construtor do Apple */
  BKOpenButton.apple({
    super.key,
    this.backgroundColor = BKOpenColors.white,
    this.borderColor = BKOpenColors.darkGrey,
    this.textColor = BKOpenColors.darkGrey,
    this.text,
    this.image,
    this.imageLeft,
    this.imageRight,
    this.enabled = true,
    this.onTap,
    this.height = 45,
    this.width,
    this.startMargin,
    this.textStyle = Styles.oauthButtonLabel,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.imagePadding = 5,
  }) {
    imageLeft = enabled
        ? SvgPicture.asset('assets/images/ic_apple.svg')
        : SvgPicture.asset('assets/images/ic_apple.svg',
            color: BKOpenColors.white);
  }

  /* Construtor Outline */
  BKOpenButton.outline(
      {super.key,
      this.backgroundColor = BKOpenColors.white,
      this.borderColor = BKOpenColors.highlight,
      this.textColor = BKOpenColors.primary,
      this.text,
      this.image,
      this.imageLeft,
      this.imageRight,
      this.enabled = true,
      this.onTap,
      this.height = 45,
      this.width,
      this.startMargin,
      this.textStyle /*  = Styles.oauthButtonLabel */,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.mainAxisSize = MainAxisSize.max,
      this.imagePadding = 5,
      this.widthBorder = 1});

  BKOpenButton.home(
      {super.key,
      this.backgroundColor = BKOpenColors.highlight,
      this.borderColor = BKOpenColors.highlight,
      this.textColor = BKOpenColors.white,
      this.text,
      this.image,
      this.imageLeft,
      this.imageRight,
      this.enabled = true,
      this.onTap,
      this.height = 45,
      this.width,
      this.startMargin,
      this.textStyle /*  = Styles.oauthButtonLabel */,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.mainAxisSize = MainAxisSize.max,
      this.imagePadding = 5,
      this.widthBorder = 1});

  /* Construtor Outline */

  /* Construtor Outline Secondary*/
  BKOpenButton.secondary({
    super.key,
    this.backgroundColor = BKOpenColors.white,
    this.borderColor = BKOpenColors.secondary,
    this.textColor = BKOpenColors.secondary,
    this.text,
    this.image,
    this.imageLeft,
    this.imageRight,
    this.enabled = true,
    this.onTap,
    this.height = 45,
    this.width,
    this.startMargin,
    this.textStyle = Styles.oauthButtonLabel,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.imagePadding = 5,
  });

  /* Construtor Outline White*/
  BKOpenButton.white({
    super.key,
    this.backgroundColor = BKOpenColors.transparent,
    this.borderColor = BKOpenColors.white,
    this.textColor = BKOpenColors.white,
    this.text,
    this.image,
    this.imageLeft,
    this.imageRight,
    this.enabled = true,
    this.onTap,
    this.height = 45,
    this.width,
    this.startMargin,
    this.textStyle = Styles.oauthButtonLabel,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.imagePadding = 20,
  });

  /* Construtor Outline Grey*/
  BKOpenButton.grey({
    super.key,
    this.backgroundColor = BKOpenColors.white,
    this.borderColor = BKOpenColors.disabled,
    this.textColor = BKOpenColors.greyTitleTab,
    this.text,
    this.image,
    this.imageLeft,
    this.imageRight,
    this.enabled = true,
    this.onTap,
    this.height = 45,
    this.width,
    this.startMargin,
    this.textStyle = Styles.oauthButtonLabel,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.imagePadding = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .055,
      width: width ?? MediaQuery.of(context).size.width * .84,
      decoration: BoxDecoration(
        color: enabled ? backgroundColor : BKOpenColors.disabled,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            color: enabled ? borderColor : BKOpenColors.disabled,
            width: widthBorder ?? 1),
      ),
      child: Material(
        color: BKOpenColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: enabled
              ? () {
                  /* EventLoggerRepository().logEvent(Strings.event_name_button_clicked, params: {
                    Strings.event_param_button_label: text ?? image ?? imageLeft ?? imageRight ?? ''
                  }); */
                  onTap?.call();
                }
              : null,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildButtonContents(),
          ),
        ),
      ),
    );
  }

  _buildButtonContents() {
    var ret = <Widget>[
      if (mainAxisAlignment == MainAxisAlignment.start)
        SizedBox(width: startMargin)
      else
        const SizedBox(width: 10),
    ];
    if (enabled) {
      if (imageLeft != null) {
        ret.add(imageLeft!);
        ret.add(SizedBox(width: imagePadding));
      }
      ret.add(Flexible(
        child: FittedBox(
          fit: BoxFit.contain,
          child: text != null
              ? Text(
                  text!,
                  maxLines: 1,
                  style: textStyle?.apply(color: textColor) ??
                      Styles.buttonLabel.apply(color: textColor),
                )
              : image ?? const SizedBox(height: 1, width: 1),
        ),
      ));
      if (imageRight != null) {
        ret.add(SizedBox(width: imagePadding));
        ret.add(imageRight!);
      }
    } else {
      if (imageLeft != null) {
        ret.add(imageLeft!);
        ret.add(SizedBox(width: imagePadding));
      }
      ret.add(Flexible(
        child: FittedBox(
          child: Text(
            text!,
            maxLines: 1,
            style: textStyle?.apply(
                  color: BKOpenColors.white,
                ) ??
                Styles.buttonLabel.apply(color: BKOpenColors.white),
          ),
        ),
      ));
      if (imageRight != null) {
        ret.add(SizedBox(width: imagePadding));
        ret.add(imageRight!);
      }
    }
    ret.add(const SizedBox(width: 10));
    return ret;
  }
}
