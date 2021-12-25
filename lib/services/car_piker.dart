import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yumeecoclone/screeens/home/home.dart';
import 'package:yumeecoclone/view/car_servises.dart';

class CarPicker extends StatefulWidget {
  String CarModel = "Model";
  Function addToList;

  CarPicker({this.CarModel, this.addToList});

  @override
  _CarPickerState createState() => _CarPickerState();
}

class _CarPickerState extends State<CarPicker> {
  //String CarModel = "Model";
  String valueManifucture = "Manufacturer";
  String valueModel = "";
  bool disableDropDown = true;
  List<DropdownMenuItem<String>> menuitems = List();

  // String get valuemodel{return value;}

  // these are Maps consist of key: value
  final honda = {"1": "Cevic", "2": "Accord", "3": "CRV", "4": "Odyssey"};

// I think I can change then to enum
  final toyota = {
    "1": "Rav 4",
    "2": "Corolla",
    "3": "Camry",
  };

  final dodge = {
    "1": "Caliber",
    "2": "Caravan",
    "3": "Journy",
  };

  void populateHonda() {
    for (String key in honda.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: honda[key],
        child: Center(
          child: Text(honda[key]),
        ),
      ));
    }
  }

  void populateToyota() {
    for (String key in toyota.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: toyota[key],
        child: Center(
          child: Text(toyota[key]),
        ),
      ));
    }
  }

  void populateDodge() {
    for (String key in dodge.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: dodge[key],
        child: Center(
          child: Text(dodge[key]),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ///////////////////////////////////////////////////////// Manifacture ////////////////////////////////////////
            Padding(
              padding: EdgeInsets.all(1.0),
              child: DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    value: "honda",
                    child: Center(
                      child: Text("Honda"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Toyota",
                    child: Center(
                      child: Text("Toyota"),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "Dodge",
                    child: Center(
                      child: Text("Dodge"),
                    ),
                  ),
                ],
                onChanged: (_value) => {
                  if (_value == "honda")
                    {menuitems = [], populateHonda(), widget.CarModel = "Model"}
                  else if (_value == "Toyota")
                    {
                      menuitems = [],
                      populateToyota(),
                      widget.CarModel = "Model"
                    }
                  else if (_value == "Dodge")
                    {
                      menuitems = [],
                      populateDodge(),
                      widget.CarModel = "Model"
                    },
                  setState(() {
                    valueManifucture = _value;
                    disableDropDown = false;
                  }),
                },
                hint: Text("$valueManifucture"),
              ),
            ),

            SizedBox(width: 10),
            ///////////////////////////////////////////////////////////////////////////////////////////////////// Model ///////////////////////////////////////////////////
            Padding(
              padding: EdgeInsets.all(1.0),
              child: DropdownButton<String>(
                items: menuitems,
                onChanged: disableDropDown ? null : widget.addToList,

//               (_value) => setState(() {
//                          CarModel = _value;
//                        }),

                hint: Text("${widget.CarModel}"),
                disabledHint: Text("select the manifucture first"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
