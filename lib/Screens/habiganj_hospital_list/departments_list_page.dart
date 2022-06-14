import 'package:e9care/Screens/habiganj_hospital_list/habiganj_doctor_list_page.dart';
import 'package:e9care/Services/api_fetch_service.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';

class DepartmentListPage extends StatefulWidget {
  const DepartmentListPage(
      {Key? key,
      required this.hospitalIndex,
      required this.hospitalName,
      required this.counterNumber})
      : super(key: key);

  final hospitalIndex;
  final hospitalName;
  final counterNumber;

  @override
  State<DepartmentListPage> createState() => _DepartmentListPageState();
}

class _DepartmentListPageState extends State<DepartmentListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<ApiFetchService>(context, listen: false)
    //     .getDepartmentList(widget.hospitalIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Center(
          child: Text(
            "কোন বিভাগের ডাক্তার দেখাতে চান",
          ),
        ),
        gradient: const LinearGradient(
            colors: [Color(0xff5ba52a), Color(0xff367d06)]),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(children: [
          Consumer<ApiFetchService>(
              builder: (context, provider, child) => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: provider
                        .allData.data[widget.hospitalIndex].departments.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(provider
                              .allData
                              .data[widget.hospitalIndex]
                              .departments[index]
                              .departmentName),
                          trailing: const Icon(Icons.arrow_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      DoctorListPage(
                                        hospitalIndex: widget.hospitalIndex,
                                        departmentId: provider
                                            .allData
                                            .data[widget.hospitalIndex]
                                            .departments[index]
                                            .id,
                                        hospitalName: widget.hospitalName,
                                        counterNumber: widget.counterNumber,
                                      )),
                            );
                          },
                        ),
                      );
                    },
                  ))
        ]),
      ),
    );
  }
}
