import 'package:e9care/Screens/Appointment/appointment_form_page.dart';
import 'package:e9care/Services/api_fetch_service.dart';
import 'package:e9care/Utils/common_helper.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorDetailsPage extends StatefulWidget {
  const DoctorDetailsPage({
    Key? key,
    required this.name,
    required this.title,
    required this.specialist,
    required this.day,
    required this.time,
    required this.hospitalName,
    required this.counterNumber,
  }) : super(key: key);

  final name;
  final title;
  final specialist;
  final day;
  final time;
  final hospitalName;
  final counterNumber;

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<ApiFetchService>(context, listen: false)
    //     .getDoctorList(widget.departmentId, widget.hospitalIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Center(
          child: Text(
            "ডাক্তারের বিস্তারিত",
          ),
        ),
        gradient: const LinearGradient(
            colors: [Color(0xff5ba52a), Color(0xff367d06)]),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          margin: const EdgeInsets.only(top: 30),
          child: Consumer<ApiFetchService>(
            builder: (context, provider, child) => Column(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonHelper().titleCommon(
                        'ডাক্তারের তথ্য',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //Service row

                      Container(
                        child: CommonHelper().bRow(
                          'null',
                          'নাম',
                          widget.name.toString(),
                        ),
                      ),
                      Container(
                        child: CommonHelper().bRow(
                          'null',
                          'হাসপাতাল',
                          widget.hospitalName.toString(),
                        ),
                      ),

                      Container(
                        child: CommonHelper()
                            .bRow('null', 'পদবী', widget.title.toString()),
                      ),
                      Container(
                        child: CommonHelper().bRow(
                            'null', 'বিশেষজ্ঞ', widget.specialist.toString()),
                      ),
                      Container(
                        child: CommonHelper()
                            .bRow('null', 'দিন', widget.day.toString()),
                      ),
                      Container(
                        child: CommonHelper().bRow(
                            'null', 'সময়', widget.time.toString(),
                            lastBorder: false),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: CommonHelper().bRow(
                          'null',
                          'কাউন্টার ফোন',
                          widget.counterNumber.toString(),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      CommonHelper().primaryButton('অ্যাপয়েন্টমেন্ট বুক করুন',
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                AppointmentFormPage(
                              doctorName: widget.name,
                              hospitalName: widget.hospitalName,
                            ),
                          ),
                        );
                      }),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: InkWell(
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green[800],
                                //
                                // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                launch('tel:01796999191');
                              },
                              child: Center(
                                child: Text(
                                  "আমাদেরকে কল করুন",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
