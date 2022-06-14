import 'package:e9care/Screens/habiganj_hospital_list/hospital_list_page.dart';
import 'package:e9care/Services/api_fetch_service.dart';
import 'package:e9care/Services/book_appointment_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabiganjHospitalListPage extends StatelessWidget {
  const HabiganjHospitalListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiFetchService()),
        ChangeNotifierProvider(create: (_) => BookAppointmentService()),
      ],
      child: MaterialApp(
        title: 'E9care',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HospitalListPage(),
      ),
    );
  }
}
