import 'package:e9care/Screens/habiganj_hospital_list/departments_list_page.dart';
import 'package:e9care/Services/api_fetch_service.dart';
import 'package:e9care/Utils/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:provider/provider.dart';

class HospitalListPage extends StatefulWidget {
  const HospitalListPage({
    Key? key,
  }) : super(key: key);

  // final locationId;

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<ApiFetchService>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const Center(
          child: Text(
            "হাসপাতাল নির্বাচন করুন",
          ),
        ),
        gradient: const LinearGradient(
            colors: [Color(0xff5ba52a), Color(0xff367d06)]),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          Consumer<ApiFetchService>(
            builder: (context, provider, child) => provider.allData != null
                ? ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: provider.allData.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Center(
                            child: Card(
                              child: ListTile(
                                leading: const Icon(
                                  Icons.local_hospital,
                                  color: Colors.red,
                                  size: 50,
                                ),
                                title: Text(
                                  provider.allData.data[index].hospitalName,
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.green,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.double_arrow,
                                  color: Colors.black,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            DepartmentListPage(
                                              hospitalIndex: index,
                                              hospitalName: provider.allData
                                                  .data[index].hospitalName,
                                              counterNumber: provider.allData
                                                  .data[index].counterPhone,
                                            )),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height - 200,
                    child: SpinKitThreeBounce(
                      color: ConstantColors().primaryColor,
                      size: 16.0,
                    ),
                  ),
          )
        ]),
      ),
    );
  }
}
