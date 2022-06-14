import 'package:e9care/Utils/constant_colors.dart';
import 'package:flutter/material.dart';

import '../../Utils/common_helper.dart';

class AppointmentSuccessPage extends StatelessWidget {
  const AppointmentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConstantColors cc = ConstantColors();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHelper().appbarCommon('', context, () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height - 220,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 85,
                  color: cc.successColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Appointment booked successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: cc.greyPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ]),
        ),
      )),
    );
  }
}
