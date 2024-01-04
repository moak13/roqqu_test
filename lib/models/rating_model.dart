import 'package:flutter/material.dart';

class RatingModel {
  final IconData? iconData;
  final String? status;
  final String? readings;
  final Color? statusColor;
  final Color? readingsColor;
  const RatingModel({
    this.iconData,
    this.status,
    this.readings,
    this.statusColor,
    this.readingsColor,
  });
}
