// ignore_for_file: library_private_types_in_public_api

import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  final String? phoneNumber;
  final String? email;
  final String? doc;
  final String? birthDate;
  final String? name;
  final String? lastName;
  final String? personality;
  final String? pais;
  final bool? isPhoneorEmail;
  final bool? isValidadEmail;
  final bool? isValidadPhone;

  const ProfileWidget({
    super.key,
    required this.phoneNumber,
    required this.email,
    required this.doc,
    required this.birthDate,
    this.name,
    this.lastName,
    this.personality,
    this.pais,
    this.isPhoneorEmail,
    this.isValidadEmail,
    this.isValidadPhone,
  });

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              setState(() {
                showDetails = !showDetails;
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
              child: Container(
                width: 135,
                height: 30,
                decoration: BoxDecoration(
                  color: BKOpenColors.secondary,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Visualizar dados",
                      style: Styles.buttonLabel.copyWith(
                        color: BKOpenColors.white,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      showDetails
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: BKOpenColors.backgroudNotif,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              _buildProfileDetail(
                  'Nome', widget.name!, widget.name!, false, '', false),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 8),
              _buildProfileDetail('Sobrenome', widget.lastName ?? '-',
                  widget.lastName ?? '-', false, '', false),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 8),
              // _buildProfileDetail('Personalidade', widget.personality ?? '-',
              //     widget.personality ?? '-', false, '', false),
              // Divider(thickness: 1, color: Colors.grey),
              // SizedBox(height: 8),
              _buildProfileDetail(
                  'Documento',
                  showDetails ? _formatCPF(widget.doc) : _maskCPF(widget.doc),
                  _formatCPF(widget.doc),
                  false,
                  '',
                  false),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 8),
              _buildProfileDetail(
                  'Data de nascimento',
                  showDetails
                      ? _formatBirthDate(widget.birthDate)
                      : _maskBirthDate(widget.birthDate),
                  _formatBirthDate(widget.birthDate),
                  false,
                  '',
                  false),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 8),
              _buildProfileDetail('País', widget.pais ?? '-',
                  widget.pais ?? '-', false, '', false),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 8),
              _buildProfileDetail(
                  'E-mail',
                  showDetails
                      ? widget.email ?? '-'
                      : _maskEmail(widget.email ?? '-'),
                  widget.email ?? '-',
                  true,
                  'Validar e-mail',
                  widget.isValidadPhone!),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(height: 8),
              _buildProfileDetail(
                  'Telefone celular',
                  showDetails
                      ? _formatPhone(widget.phoneNumber)
                      : _maskPhone(widget.phoneNumber),
                  _formatPhone(widget.phoneNumber),
                  true,
                  'Validar telefone',
                  widget.isValidadPhone!),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileDetail(String title, String maskedData, String revealData,
      bool? isPhoneorEmail, String? texto, bool isValided) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 6, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.textForm.copyWith(
                  color: BKOpenColors.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                maskedData,
                style: Styles.labelText.copyWith(
                  color: BKOpenColors.blackSub,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Visibility(
              visible: isPhoneorEmail ?? false,
              child: isValided
                  ? Padding(
                      padding: const EdgeInsets.only(
                          right: 16.0, top: 8.0, bottom: 8.0),
                      child: Container(
                        width: 80,
                        height: 26,
                        decoration: BoxDecoration(
                          color: BKOpenColors.statusGreen,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Validado",
                              style: Styles.buttonLabel.copyWith(
                                color: BKOpenColors.white,
                                fontSize: 10,
                              ),
                            ),
                            Icon(
                              Icons.check_circle_outline,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox())
        ],
      ),
    );
  }

  String _maskEmail(String email) {
    if (email.isEmpty || !email.contains('@')) {
      return '-';
    }
    final List<String> parts = email.split('@');
    final String username = parts[0];
    if (username.length < 2) {
      return '***@${parts[1]}';
    }
    final String maskedUsername = username.substring(0, 1) +
        '*' * (username.length - 2) +
        username.substring(username.length - 1);
    final String domain = parts[1];
    final String maskedDomain = '*' * (domain.length - 6) + domain.substring(6);
    return '$maskedUsername@$maskedDomain';
  }

  String _maskPhone(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.length < 10) {
      return '-';
    }
    return '(**) *****-${phoneNumber.substring(10)}';
  }

  String _formatPhone(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.length < 10) {
      return '-';
    }
    return '(${phoneNumber.substring(2, 4)}) ${phoneNumber.substring(4, 9)}-${phoneNumber.substring(9)}';
  }

  String _maskCPF(String? cpf) {
    if (cpf == null || cpf.length != 11) {
      return '-';
    }
    return '***.***.${cpf.substring(6, 9)}-${cpf.substring(9)}';
  }

  String _formatCPF(String? cpf) {
    if (cpf == null || cpf.length != 11) {
      return '-';
    }
    return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';
  }

  String _maskBirthDate(String? birthDate) {
    if (birthDate == null || birthDate.length < 10) {
      return '-';
    }

    return '**/**/${birthDate.substring(0, 4)}';
  }

  String _formatBirthDate(String? birthDate) {
    if (birthDate == null || birthDate.length < 10) {
      return '-';
    }
    try {
      DateTime parsedDate = DateTime.parse(birthDate);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return '-';
    }
  }
}
