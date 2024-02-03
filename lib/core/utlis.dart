import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageExtension {
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
}
