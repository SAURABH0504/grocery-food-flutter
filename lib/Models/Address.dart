import 'package:flutter/material.dart';

class Address {
  String addressLine1;
  String addressLine2;
  String city;
  String pinCode;
  String addressType;
  bool defaultDelivery;

  Address(
      {this.addressLine1,
      this.addressLine2,
      this.city,
      this.pinCode,
      this.addressType,
      this.defaultDelivery});
}
