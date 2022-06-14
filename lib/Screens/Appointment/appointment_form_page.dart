import 'package:e9care/Utils/constant_colors.dart';
import 'package:e9care/Utils/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Services/book_appointment_service.dart';
import '../../Utils/common_helper.dart';

class AppointmentFormPage extends StatefulWidget {
  const AppointmentFormPage(
      {Key? key, required this.doctorName, required this.hospitalName})
      : super(key: key);

  final String doctorName;
  final hospitalName;

  @override
  State<AppointmentFormPage> createState() => _AppointmentFormPageState();
}

class _AppointmentFormPageState extends State<AppointmentFormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ConstantColors cc = ConstantColors();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonHelper().appbarCommon(widget.doctorName, context, () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //hospital name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonHelper().labelCommon("(${widget.hospitalName})" ?? ''),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              //Name ============>
              CommonHelper().labelCommon("Your name"),

              CustomInput(
                controller: nameController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                hintText: "Your name",
                paddingHorizontal: 20,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 2,
              ),

              //Age ============>
              CommonHelper().labelCommon("Your age"),

              CustomInput(
                controller: ageController,
                isNumberField: true,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                hintText: "Your age",
                paddingHorizontal: 20,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 2,
              ),

              //Address ============>
              CommonHelper().labelCommon("Your address"),

              CustomInput(
                controller: addressController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                hintText: "Your address",
                paddingHorizontal: 20,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 2,
              ),

              //Mobile number ============>
              CommonHelper().labelCommon("Your mobile"),

              CustomInput(
                controller: mobileController,
                isNumberField: true,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
                hintText: "Your mobile number",
                paddingHorizontal: 20,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 2,
              ),

              Consumer<BookAppointmentService>(
                builder: (context, provider, child) =>
                    CommonHelper().primaryButton("Book Appointment", () {
                  if (provider.isloading == false) {
                    if (_formKey.currentState!.validate()) {
                      provider.bookAppointment(
                          context,
                          nameController.text.trim(),
                          ageController.text.trim(),
                          addressController.text.trim(),
                          mobileController.text.trim(),
                          '${widget.doctorName} (${widget.hospitalName})');
                    }
                  }
                }, isloading: provider.isloading == false ? false : true),
              ),
            ]),
          ),
        ),
      )),
    );
  }
}
