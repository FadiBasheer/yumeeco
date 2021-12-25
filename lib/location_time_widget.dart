import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:yumeeco_test/constant/constants.dart';
import 'package:yumeeco_test/database.dart';
import 'time_picker/days_view.dart';
import 'payment/payment.dart';

class LocationAndTimeWidget extends StatefulWidget {
  static String id = 'LocationAndTimeWidget';
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _LocationAndTimeWidgetState createState() => _LocationAndTimeWidgetState();
}

class _LocationAndTimeWidgetState extends State<LocationAndTimeWidget> {
  final _auth = FirebaseAuth.instance;
  DateTime selectedDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  PickResult selectedPlace;
  String name = '';
  String note = '';
  String PhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    validator: (val) => val.length >= 2
                        ? 'Name at least 2 char'
                        : null, // to chech if it's greater than 2
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                  SizedBox(height: 20.0),

                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Phone Number'),
                    validator: (val) => val.length == 10
                        ? 'Phone number must be 10 numbers'
                        : null, //to chech if is it equal to 10.
                    onChanged: (val) {
                      setState(() => PhoneNumber = val);
                    },
                  ),
                  SizedBox(height: 20.0),

                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Note'),
                    onChanged: (val) {
                      setState(() => note = val);
                    },
                  ),
                  SizedBox(height: 20.0),

                  Text(dateFormat.format(selectedDate)),

// The original choose date and time
//        RaisedButton(
//          child: Text('Choose new date time'),
//          onPressed: () async {
//            showDateTimeDialog(context, initialDate: selectedDate,
//                onSelectedDate: (selectedDate) {
//              setState(() {
//                this.selectedDate = selectedDate;
//              });
//            });
//          },
//        ),

                  RaisedButton(
                      child: Text('Choose date and Time'),
                      color: Colors.redAccent,
                      onPressed: () async {
                        // choose date screen
                        final selectedDate = await _selectDateTime(context);
                        if (selectedDate == null)
                          return;
                        else {
                          this.selectedDate = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                          );
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => Container(
                              height: 400,
                              child: Column(
                                children: <Widget>[
                                  Expanded(child: DemoDayView(selectedDate)),
                                ],
                              ),
                            ),
                          );
                        }
                      }),

                  RaisedButton(
                    child: Text("Choose the location of the service"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PlacePicker(
                              apiKey: "AIzaSyCylLOD24cLBnBSSjr7Fq8L1FyECsYw6P4",
                              initialPosition:
                                  LocationAndTimeWidget.kInitialPosition,
                              useCurrentLocation: true,
                              //usePlaceDetailSearch: true,
                              onPlacePicked: (result) {
                                selectedPlace = result;
                                Navigator.of(context).pop();
                                setState(() {});
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                  selectedPlace == null
                      ? Container()
                      : Text(selectedPlace.formattedAddress ?? ""),

                  RaisedButton(
                      color: Colors.yellow,
                      onPressed: () async {
                        // await DatabaseService(uid: _auth.currentUser.uid)
                        //     .updateUserData(
                        //         name,
                        //         PhoneNumber,
                        //         note,
                        //         dateFormat.format(selectedDate),
                        //         selectedPlace.formattedAddress);
                        Navigator.pushNamed(context, pay.id);
                      },
                      child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(fontSize: 25),
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 30)),
      );
}
