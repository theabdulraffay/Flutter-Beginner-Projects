import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Schyler',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Schyler',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Schyler',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

var kTextFieldInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  prefixIcon:const Icon(
    Icons.location_city,
    color: Colors.black,
  ),
  hintText: 'Enter City Name',
  hintStyle: const TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
);
