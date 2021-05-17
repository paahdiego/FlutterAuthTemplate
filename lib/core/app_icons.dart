import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static String get chat => "assets/icons/chat.svg";
  static String get facebook => "assets/icons/facebook.svg";
  static String get twitter => "assets/icons/twitter.svg";
  static String get googlePlus => "assets/icons/google-plus.svg";
  static String get login => "assets/icons/login.svg";
  static String get signup => "assets/icons/signup.svg";

  static Future<void> loadCache() {
    return Future.wait([
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, AppIcons.chat),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, AppIcons.facebook),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, AppIcons.twitter),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, AppIcons.googlePlus),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, AppIcons.signup),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, AppIcons.login),
        null,
      ),
    ]);
  }
}
