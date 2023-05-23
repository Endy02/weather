import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  // Instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getLocation() async {
    bool isServiceEnable;
    LocationPermission locationPermission;

    isServiceEnable = await Geolocator.isLocationServiceEnabled();

    // Return if service is disable
    if (!isServiceEnable) {
      return Future.error("Location not enable");
    }

    // Status of permissions
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied Forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    // Get the current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // Update our latitude and longitude
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      _isLoading.value = false;
    });
  }
}
