import 'package:geolocator/geolocator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Location {
  double latitude;
  double longitude;

  get context => null;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      this.longitude = position.longitude;
      this.latitude = position.latitude;
    }  catch (e) {
      Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

    }
  }
}
