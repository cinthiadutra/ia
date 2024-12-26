// ignore_for_file: unused_element, library_private_types_in_public_api

import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ComplexTextInput extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? initialValue;

  final bool? enabled;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool showObscureButton;
  final TextInputAction? textInputAction;
  final TextEditingController? textEditingController;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final Function? onChanged;
  final Function(String?)? onSubmitted;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool isSecret;
  final String textCampo;
  final bool hasLabel;
  final IconData? suffixIcon;
  final int? maxLenght;

  const ComplexTextInput({
    super.key,
    this.hintText,
    this.labelText,
    this.errorText,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.obscureText = false,
    this.showObscureButton = false,
    this.textInputAction,
    this.textEditingController,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.cursorColor,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.autovalidateMode,
    this.isSecret = false,
    this.textCampo = "Pergunta",
    this.hasLabel = true,
    this.suffixIcon,
    this.maxLenght,
    this.initialValue,
  });
  const ComplexTextInput.without(
      {super.key,
      this.hintText,
      this.labelText,
      this.errorText,
      this.enabled = true,
      this.keyboardType = TextInputType.text,
      this.inputFormatters,
      this.obscureText = false,
      this.showObscureButton = false,
      this.textInputAction,
      this.textEditingController,
      this.textCapitalization = TextCapitalization.none,
      this.autofocus = false,
      this.cursorColor,
      this.focusNode,
      this.onChanged,
      this.onSubmitted,
      this.validator,
      this.autovalidateMode,
      this.isSecret = false,
      this.hasLabel = false,
      this.textCampo = '',
      this.suffixIcon,
      this.maxLenght,
      this.initialValue});

  @override
  _ComplexTextInputState createState() => _ComplexTextInputState();
}

class _ComplexTextInputState extends State<ComplexTextInput> {
  late final Rx<bool> _obscureText = Rx<bool>(true);
  FocusNode? _focusNode;
  bool isObscure = true;

  @override
  void initState() {
    isObscure = widget.isSecret;
    _obscureText.value = false;
    _focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Obx(
            () => ListView(shrinkWrap: true, children: [
              Visibility(
                visible: widget.hasLabel,
                child: Text(
                  widget.textCampo,
                  style: Styles.textForm,
                ),
              ),
              BKOpenSpacing.x8,
              TextFormField(
                initialValue: widget.initialValue,
                textAlign: TextAlign.start,
                onSaved: widget.onSubmitted,
                validator: widget.validator,
                autovalidateMode: widget.autovalidateMode,
                focusNode: _focusNode,
                autofocus: widget.autofocus,
                controller: widget.textEditingController,
                textInputAction: widget.textInputAction,
                enabled: widget.enabled,
                textCapitalization: widget.textCapitalization,
                obscureText: _obscureText.value,
                cursorColor: widget.cursorColor,
                maxLength: widget.maxLenght,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxHeight: Get.height * 0.28, maxWidth: Get.width * 0.9),
                  contentPadding: const EdgeInsets.all(10),
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: BKOpenColors.borderGrey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: BKOpenColors.borderGrey,
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: widget.isSecret
                      ? IconButton(
                          iconSize: 20,
                          padding: const EdgeInsets.only(top: 3, right: 10),
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            setState(() {
                              _obscureText.value = !_obscureText.value;
                            });
                          },
                          icon: Icon(
                            _obscureText.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: BKOpenColors.primary,
                          ),
                        )
                      : Icon(
                          widget.suffixIcon,
                          color: BKOpenColors.secondary,
                        ),

                  hintStyle: Styles.labelText,

                  hintText: widget.hintText,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  //    contentPadding: const EdgeInsets.only(bottom: 6),
                ),
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                onChanged: widget.onChanged as void Function(String)?,
                style: widget.enabled!
                    ? Styles.labelText
                    : Styles.labelText.apply(color: BKOpenColors.hintTextForm),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          )
        ]);
  }
}
