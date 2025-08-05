import 'package:flutter/material.dart';

const texfieldDecoration = InputDecoration(
  fillColor: Color(0xFFE8EDF5),
  contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 3),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Color.fromARGB(255, 220, 216, 232)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Color.fromARGB(255, 29, 31, 31)),
  ),
  errorBorder: InputBorder.none,
  filled: true,
  disabledBorder: InputBorder.none,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Color.fromARGB(255, 249, 248, 250)),
  ),
  hintText: 'Search Student',
  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
);

const textButtonColor = Color(0xFF0D80F2);
