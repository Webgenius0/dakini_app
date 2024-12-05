// // ignore_for_file: unused_field
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '/constants/app_constants.dart';
// import '../helpers/helper_methods.dart';
// import '/helpers/toast.dart';
// import '../helpers/di.dart';

// final class MapScreen extends StatefulWidget {
//   final double? lat;
//   final double? long;
//   const MapScreen({super.key, this.lat, this.long});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   /// Determine the current position of the device.
//   ///
//   /// When the location services are not enabled or permissions
//   /// are denied the `Future` will return an error.
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error('Location permissions are permanently denied, we cannot request permissions.');
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }

// // A set of markers to display on the map
//   final Set<Marker> _markers = {};

// // The currently selected marker
//   Marker? _selectedMarker;

// // The Google Map controller
//   GoogleMapController? _mapController;

// // The custom icon for the marker
//   BitmapDescriptor? _icon;

//   @override
//   void initState() {
//     super.initState();
// // Load the custom icon from the assets folder
//     _loadIcon();
// //load location data after checking if any location is selected

//     if (!appData.read(kKeySelectedLocation)) {
//       _determinePosition().then((position) {
//         updateLocation(LatLng(position.latitude, position.longitude), true, context);
//       }, onError: (e) {
//         updateLocation(
//             LatLng(
//               appData.read(kKeySelectedLat),
//               appData.read(kKeySelectedLng),
//             ),
//             false,
//             context);
//         ToastUtil.showShortToast(e.toString());
//       });
//     } else {
//       updateLocation(LatLng(widget.lat ?? appData.read(kKeySelectedLat), widget.long ?? appData.read(kKeySelectedLng)),
//           false, null);
//     }
//   }

// // A method to load the custom icon from the assets folder
//   Future<void> _loadIcon() async {
//     final icon = await BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(devicePixelRatio: 2.5),
//       'assets/icons/mapmarker.png',
//     );
//     setState(() {
//       _icon = icon;
//     });
//   }

// // A method to update location marker
//   void updateLocation(LatLng latLng, bool updateLocal, BuildContext? context) async {
//     _markers.clear();
//     //for updating camera position
//     _mapController?.animateCamera(CameraUpdate.newLatLngZoom(latLng, 19.151926040649414));
//     //for updating local storage
//     if (updateLocal) {
//       setLocationLatLong(latLng, selectedLocation: appData.read(kKeySelectedLocation));
//     }
//     //for getting address
//     if (context != null) {
//       getAddressFromPosition(latLng, context);
//     }

//     setState(() {
//       _markers.add(_createMarker(latLng));
//     });
//   }

// // A method to create a marker from a given position
//   Marker _createMarker(LatLng position) {
//     return Marker(
// // Generate a unique id for each marker
//       markerId: MarkerId(position.toString()),
// // Set the position of the marker
//       position: position,
// // Set the icon of the marker
//       icon: _icon ?? BitmapDescriptor.defaultMarker, // Use the custom icon if available
// // Set the info window of the marker
//       // infoWindow: const InfoWindow(
//       //   title: 'Marker',
//       //   snippet: 'This is a marker',
//       // ),
// // Set the onTap callback of the marker
//       onTap: () {
// // Update the selected marker state

//         setState(() {
//           _selectedMarker = _markers.firstWhere((marker) => marker.markerId == MarkerId(position.toString()));
//         });
// // Show the info window of the selected marker
//         _mapController?.showMarkerInfoWindow(MarkerId(position.toString()));
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         //myLocationEnabled: true,
//         gestureRecognizers: {
//           Factory<OneSequenceGestureRecognizer>(
//             () => EagerGestureRecognizer(),
//           ),
//         },

//         // Set the initial camera position
//         initialCameraPosition: CameraPosition(
//           target: LatLng(widget.lat ?? appData.read(kKeySelectedLat), widget.long ?? appData.read(kKeySelectedLng)),
//           zoom: 12.4746,
//         ),
//         // Set the onMapCreated callback
//         onMapCreated: (GoogleMapController controller) {
//           _mapController = controller;
//         },

//         // Set the markers to display on the map
//         markers: _markers,
//         onTap: (argument) => updateLocation(argument, false, context),
//       ),
//     );
//   }
// }
