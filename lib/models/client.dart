import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  String name;
  Timestamp date;
  int installers;
  int movers;
  String iconUrl;

  dynamic getIcon() {
    if(iconUrl == null) {
       return Icon(Icons.event_seat);
    }
    return Container(
      child: Center(
        child: Image.network(iconUrl)),
      width: 35,
      height: 35,
    );
  }

  String getDateAsString() {
    if(date == null) {
      return "Date unspecified";
    }
    Timestamp timestamp = date;
    var d = DateFormat.yMMMd().format(
              DateTime.fromMillisecondsSinceEpoch(
              timestamp.millisecondsSinceEpoch));
    return d;
  }

  validateClientData(Map<String, dynamic> data) {
    if(data == null) {
      print('There is no data for this record.');
    }
    if (data.containsKey("clientname")) {
      name = data["clientname"];
    }
    else {
      name = "No name is present";
    }
    if (data.containsKey("date")) {
      date = data["date"];
    }

    if (data.containsKey("iconUrl")) {
      iconUrl = data["iconUrl"];
    }
  }
}