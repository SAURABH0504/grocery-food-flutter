import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:vendor_app/Models/Address.dart';

class AddressFormScreen extends StatefulWidget {
  @override
  _AddressFormScreenState createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final _formKey = GlobalKey<FormState>();


  Address address=Address();

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

                        attribute: "address-line-1",
                        decoration: InputDecoration(
                          labelText: "Address Line 1",
                        ),
                        validators: [
                          FormBuilderValidators.minLength(2,
                              errorText: "Enter valid address"),
                        ],
                        onSaved: (val){
                          address.addressLine1=val;
                        },
                      ),
                      FormBuilderTextField(

                        attribute: "address-line-2",
                        decoration:
                            InputDecoration(labelText: "Address Line 2"),
                        onSaved: (val){
                          address.addressLine2=val;
                        },
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: FormBuilderTextField(

                              attribute: "city",
                              decoration: InputDecoration(labelText: "City"),
                              validators: [
                                FormBuilderValidators.minLength(2,
                                    errorText: "Enter valid city"),
                              ],
                              onSaved: (val){
                                address.city=val;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Flexible(
                            child: FormBuilderTextField(

                              attribute: "pincode",
                              decoration: InputDecoration(labelText: "PinCode"),
                              validators: [
                                FormBuilderValidators.min(6,
                                    errorText: "Enter valid PinCode"),
                              ],
                              keyboardType: TextInputType.number,
                              onSaved: (val){
                                address.pinCode=val;
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
                        onSaved: (val){
                          address.addressType=val;
                        },
                      ),
                      FormBuilderSwitch(
                        label: Text('Set this as my default delivery address',
                        style: TextStyle(
                          fontSize: 16
                        ),),
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
