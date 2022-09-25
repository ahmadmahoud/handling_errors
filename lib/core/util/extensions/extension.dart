import 'package:flutter/material.dart';
import 'package:handling_error/core/handling_errors/exceptions.dart';
import 'package:handling_error/core/util/database/remote/dio_helper.dart';
import 'package:dio/dio.dart';

extension NavigationContext on BuildContext {
  get pop => Navigator.pop(this);
  set push(String page) => Navigator.pushNamed(this, page);
}