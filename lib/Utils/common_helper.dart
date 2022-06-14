import 'package:e9care/utils/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonHelper {
  ConstantColors cc = ConstantColors();

  appbarCommon(String title, BuildContext context, VoidCallback pressed) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: cc.greyPrimary),
      title: Text(
        title,
        style: TextStyle(
            color: cc.greyPrimary, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
        onTap: pressed,
        child: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
      ),
    );
  }

  labelCommon(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: cc.greyThree,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  primaryButton(String title, VoidCallback pressed, {isloading = false}) {
    return InkWell(
      onTap: pressed,
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: cc.primaryColor, borderRadius: BorderRadius.circular(8)),
          child: isloading == false
              ? Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                )
              : showLoading(Colors.white)),
    );
  }

// Constant suff ===========================>

  void showToast(String msg, Color? color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showLoading(Color color) {
    return SpinKitThreeBounce(color: color, size: 16.0);
  }

  titleCommon(String title) {
    return Text(
      title,
      style: TextStyle(
          color: cc.greyPrimary, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  bRow(String icon, String title, String text, {bool lastBorder = true}) {
    return Column(
      children: [
        Row(
          children: [
            //icon
            SizedBox(
              width: 125,
              child: Row(children: [
                icon != 'null'
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            icon,
                            height: 19,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                      )
                    : Container(),
                Text(
                  title,
                  style: TextStyle(
                    color: cc.greyFour,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ]),
            ),

            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: cc.greyFour,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        lastBorder == true
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 14),
                child: CommonHelper().dividerCommon(),
              )
            : Container()
      ],
    );
  }

  dividerCommon() {
    return Divider(
      thickness: 1,
      height: 2,
      color: cc.borderColor,
    );
  }
}
