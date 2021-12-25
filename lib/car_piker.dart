import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumeeco_test/task_data.dart';

import 'Car_Item_list.dart';

class CarPicker extends StatefulWidget {
//  String CarModel = "Model";
//  Function addToList;
//
//  CarPicker({this.CarModel, this.addToList});

  @override
  _CarPickerState createState() => _CarPickerState();
}

class _CarPickerState extends State<CarPicker> {
  String valueManifucture = "Manufacturer";
  String valueModel = "";
  String CarModel = "Model";
  Map man;

  final Honda = {"1": "Cevic", "2": "Accord", "3": "CRV", "4": "Odyssey"};
  final Toyota = {"1": "Rav 4", "2": "Corolla", "3": "Camry"};
  final Dodge = {"1": "Caliber", "2": "Caravan", "3": "Journy"};
  final manifactures = {"1": "Honda", "2": "Toyota", "3": "Dodge"};

  // bool disableDropDown = true;
  List<DropdownMenuItem<String>> menuitems = List();
  List<DropdownMenuItem<String>> manifactureitems = List();

  void populateModels(Map s) {
    for (String key in s.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: s[key],
        child: Center(
          child: Text(s[key]),
        ),
      ));
    }
  }

  void populateManifacture() {
    for (String key in manifactures.keys) {
      manifactureitems.add(DropdownMenuItem<String>(
        value: manifactures[key],
        child: Center(
          child: Text(manifactures[key]),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    manifactureitems = [];
    populateManifacture();
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ///////////////////////////////////////////////////////// Manifacture ////////////////////////////////////////
            Padding(
              padding: EdgeInsets.all(1.0),
              child: DropdownButton<String>(
                items: manifactureitems,
                onChanged: (_value) => {
                  if (_value == "Honda")
                    {menuitems = [], populateModels(Honda), CarModel = "Model"}
                  else if (_value == "Toyota")
                    {menuitems = [], populateModels(Toyota), CarModel = "Model"}
                  else if (_value == "Dodge")
                    {menuitems = [], populateModels(Dodge), CarModel = "Model"},
                  setState(() {
                    valueManifucture = _value;
                    //disableDropDown = false;
                  }),
                },
                hint: Text("$valueManifucture"),
              ),
            ),

            SizedBox(width: 10),
            ///////////////////////////////////////////////////////////////////////////////////////////////////// Model ///////////////////////////////////////////////////
//            Padding(
//              padding: EdgeInsets.all(1.0),
//              child: DropdownButton<String>(
//                items: menuitems,
//                onChanged: widget.addToList,
//                hint: Text("${widget.CarModel}"),
//                disabledHint: Text("select the manifucture first"),
//              ),
//            ),

            Padding(
              padding: EdgeInsets.all(1.0),
              child: DropdownButton<String>(
                items: menuitems,
                onChanged: (_value) {
                  CarModel = _value;
                  CarItemList fdlist;
                  if (CarModel == 'Corolla') fdlist = Corolla;
                  else if(CarModel == 'Cevic') fdlist = Cevic;
                  Provider.of<TaskData>(context,listen: false).changeCarItem(fdlist);
                },
                hint: Text("${CarModel}"),
                disabledHint: Text("select the manifucture first"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
