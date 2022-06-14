import 'package:e9care/Screens/habiganj_hospital_list/doctor_detail_page.dart';
import 'package:e9care/Services/api_fetch_service.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage(
      {Key? key,
      required this.departmentId,
      required this.hospitalIndex,
      required this.hospitalName,
      required this.counterNumber})
      : super(key: key);

  final departmentId;
  final hospitalIndex;
  final hospitalName;
  final counterNumber;

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiFetchService>(context, listen: false)
        .getDoctorList(widget.departmentId, widget.hospitalIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Center(
          child: Text(
            "ডাক্তার নির্বাচন করুন",
          ),
        ),
        gradient: const LinearGradient(
            colors: [Color(0xff5ba52a), Color(0xff367d06)]),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(children: [
          Consumer<ApiFetchService>(
              builder: (context, provider, child) => provider
                      .doctorListBasedOnDepartmentId.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: provider.doctorListBasedOnDepartmentId.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.person,
                              color: Colors.red,
                              size: 50,
                            ),
                            title: Text(provider
                                .doctorListBasedOnDepartmentId[index]
                                .doctorName),
                            trailing: const Icon(Icons.arrow_right),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        DoctorDetailsPage(
                                          name: provider
                                              .doctorListBasedOnDepartmentId[
                                                  index]
                                              .doctorName,
                                          title: provider
                                              .doctorListBasedOnDepartmentId[
                                                  index]
                                              .doctorTitle,
                                          specialist: provider
                                              .doctorListBasedOnDepartmentId[
                                                  index]
                                              .doctorSpecialist,
                                          day: provider
                                              .doctorListBasedOnDepartmentId[
                                                  index]
                                              .day,
                                          time: provider
                                              .doctorListBasedOnDepartmentId[
                                                  index]
                                              .time,
                                          hospitalName: widget.hospitalName,
                                          counterNumber: widget.counterNumber,
                                        )),
                              );
                            },
                          ),
                        );
                      },
                    )
                  : Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height - 120,
                      child: const Text(
                        'There is no doctor under this department',
                        style: TextStyle(color: Colors.red),
                      )))
        ]),
      ),
    );
  }
}
