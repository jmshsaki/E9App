import 'package:e9care/Services/ambulance_service.dart';
import 'package:e9care/Utils/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulancePage extends StatefulWidget {
  const AmbulancePage({Key? key}) : super(key: key);

  @override
  State<AmbulancePage> createState() => _AmbulancePageState();
}

class _AmbulancePageState extends State<AmbulancePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AmbulanceService>(context, listen: false).fetchAmbulance();
  }

  ConstantColors cc = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Consumer<AmbulanceService>(
              builder: (context, provider, child) => provider.ambulanceData !=
                      null
                  ? provider.ambulanceData != 'error'
                      ? Column(
                          children: [
                            for (int i = 0;
                                i < provider.ambulanceData.data.length;
                                i++)
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Ink.image(
                                              image:
                                                  AssetImage('assets/logo.png'),
                                              fit: BoxFit.fitHeight,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Image.network(
                                                provider.ambulanceData.data[i]
                                                    .picture.preview
                                                    .toString(),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                            ListTile(
                                              title: Center(
                                                child: Text(
                                                  "বুকিং নাম্বার",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              subtitle: Center(
                                                child: Text(
                                                  "Mobile: ${provider.ambulanceData.data[i].mobileNumber}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: InkWell(
                                                      child: Center(
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.green, //
                                                            // background
                                                            onPrimary: Colors
                                                                .white, // foreground
                                                          ),
                                                          onPressed: () {
                                                            launch(
                                                                'tel:01796999191');
                                                          },
                                                          child: Text(
                                                            "আমাদেরকে কল "
                                                            "করুন",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // child: SizedBox(
                                      //   width: double.infinity,
                                      //   height: 200,
                                      //   child: Image.network(
                                      //     provider.ambulanceData.data[i]
                                      //         .picture.preview
                                      //         .toString(),
                                      //     fit: BoxFit.fitHeight,
                                      //   ),
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height - 120,
                          child: const Text('Something went wrong'),
                        )
                  : Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height - 120,
                      child: SpinKitThreeBounce(
                        color: ConstantColors().primaryColor,
                        size: 16.0,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
