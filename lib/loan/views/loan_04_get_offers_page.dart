// import 'dart:async';

// import 'package:bkopen/app/routes/AppPages.dart';
// import 'package:bkopen/app/spacing/bkopen_spacing.dart';
// import 'package:bkopen/app/widgets/appbar/bkappbar.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../app/components/loading/bkopen_loading.dart';
// import '../../app/theme/styles.dart';

// class LoanGetOffersPage extends StatefulWidget {
//   const LoanGetOffersPage({super.key});

//   @override
//   State<LoanGetOffersPage> createState() => _LoanGetOffersPageState();
// }

// class _LoanGetOffersPageState extends State<LoanGetOffersPage> {
//   @override
//   void initState() {
//     // Timer(Duration(seconds: 7), () {
//       Get.toNamed(PageRoutes.loanchooseofferspage);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: BKAppBar(label: '',estaNahome: true,),
//           body: 
//              Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
//               child: Column(
//                 children: <Widget>[
//                   BKOpenSpacing.x40,
//                   BKOpenLoading(),
//                   BKOpenSpacing.x40,
//                   Center(
//                     child: Text(
//                       "Pegamos os seus dados e estamos selecionando as melhores ofertas de empréstimos para você",
//                       style: Styles.bodyText,
//                       textAlign:
//                           TextAlign.center, // Adicionando alinhamento central
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ),
//     );
//   }
// }
