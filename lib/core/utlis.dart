import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class UtilsExtension {
  static String getFileExtension(String url) {
    String extension = Uri.parse(url).pathSegments.last.split('.').last;
    return extension.toLowerCase();
  }

  //team crest image extension handler
  static Widget buildCrestImage(String crestUrl) {
    String fileExtension = getFileExtension(crestUrl);

    if (fileExtension == 'png') {
      return Image.network(crestUrl);
    } else if (fileExtension == 'svg') {
      return SvgPicture.network(crestUrl);
    } else {
      return Image.asset('assets/icons/crest.png');
    }
  }

  // match date format handler
  static Map<String, String> formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMM yyyy').format(date);
    String formattedTime = DateFormat('HH:mm').format(date);
    return {'date': formattedDate, 'time': formattedTime};
  }

  //get todays time in string
  static String getTodaysDate() {
    DateTime date = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(date);
  }

  //get todays time in int
  static int getTodaysDateInt() {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return int.parse(formattedDate);
  }

  //get future date in string
  static String getFutureDate(int days) {
    DateTime date = DateTime.now().add(Duration(days: days));
    return DateFormat('yyyy-MM-dd').format(date);
  }

  //get future date in int
  static int getFutureDateInt(int days) {
    DateTime date = DateTime.now().add(Duration(days: days));
    String formatedDate = DateFormat('yyyy-MM-dd').format(date);
    return int.parse(formatedDate);
  }
}
