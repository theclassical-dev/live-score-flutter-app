class ImageExtension {
  static String getFileExtension(String url) {
    String extension = Uri.parse(url).pathSegments.last.split('.').last;
    return extension.toLowerCase();
  }
}
