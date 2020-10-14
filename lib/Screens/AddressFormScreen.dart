import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:vendor_app/Models/Address.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddressFormScreen extends StatefulWidget {
  @override
  _AddressFormScreenState createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController line1Controller=TextEditingController();
  TextEditingController line2Controller=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController pinCodeController=TextEditingController();

  Address address = Address();
  Position _currentPosition;
  String _line1;
  String _street,_subLocality,_city;
  String _pinCode;

  _getCurrentLocation() async {
   await  getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position value) {
      setState(() {
        _currentPosition = value;
      });
    });
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      print(_currentPosition.latitude);
      print(_currentPosition.longitude);

      Placemark place = p[0];

      setState((){
        _street = place.street;
        _subLocality=place.subLocality;
        _city=place.locality;
        _pinCode = place.postalCode;
       _line1=_street+" "+_subLocality;
       line1Controller.text=_line1;
       cityController.text=_city;
       pinCodeController.text=_pinCode;
        print(_line1);
        print(_city);
        print(_pinCode);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {

    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Vendor',
          style: TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 35,
              color: Colors.orange,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Text(
              'Address Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: FormBuilder(
                  key: _formKey,
                  initialValue: {
                    'address-type': 'Home',
                  },
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        controller: line1Controller,
                        attribute: "address-line-1",
                        decoration: InputDecoration(
                          labelText: "Address Line 1",
                        ),
                        validators: [
                          FormBuilderValidators.minLength(2,
                              errorText: "Enter valid address"),
                        ],
                        onSaved: (val) {
                          address.addressLine1 = val;
                        },
                      ),
                      FormBuilderTextField(
                        controller: line2Controller,
                        attribute: "address-line-2",
                        decoration:
                            InputDecoration(labelText: "Address Line 2"),
                        onSaved: (val) {
                          address.addressLine2 = val;
                        },
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: FormBuilderTextField(
                              controller: cityController,
                              attribute: "city",
                              decoration: InputDecoration(labelText: "City"),
                              validators: [
                                FormBuilderValidators.minLength(2,
                                    errorText: "Enter valid city"),
                              ],
                              onSaved: (val) {
                                address.city = val;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Flexible(
                            child: FormBuilderTextField(
                              controller: pinCodeController,
                              attribute: "pincode",
                              decoration: InputDecoration(labelText: "PinCode"),
                              validators: [
                                FormBuilderValidators.min(6,
                                    errorText: "Enter valid PinCode"),
                              ],
                              keyboardType: TextInputType.number,
                              onSaved: (val) {
                                address.pinCode = val;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormBuilderChoiceChip(
                        attribute: "address-type",
                        options: [
                          FormBuilderFieldOption(
                              child: Text("Home"), value: "Home"),
                          FormBuilderFieldOption(
                              child: Text("Work"), value: "Work"),
                          FormBuilderFieldOption(
                              child: Text("Other"), value: "Other"),
                        ],
                        validators: [
                          FormBuilderValidators.required(errorText: 'Required')
                        ],
                        onSaved: (val) {
                          address.addressType = val;
                        },
                      ),
                      FormBuilderSwitch(
                        label: Text(
                          'Set this as my default delivery address',
                          style: TextStyle(fontSize: 16),
                        ),
                        attribute: "default-address",
                        initialValue: false,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }
                        },
                        child: Text('Add Address'),
                        color: Colors.purple,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
