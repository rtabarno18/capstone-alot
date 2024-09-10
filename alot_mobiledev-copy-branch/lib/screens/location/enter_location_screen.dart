import 'package:alot_mobiledevelopment/config/routes.gr.dart';
import 'package:alot_mobiledevelopment/models/location_list_tile.dart';
import 'package:alot_mobiledevelopment/models/place_autocomplete_response.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:alot_mobiledevelopment/controllers/map_controller.dart'
    as map_ctrl;
import 'package:permission_handler/permission_handler.dart';
import 'package:alot_mobiledevelopment/utils/network_utiliti.dart';
import 'package:alot_mobiledevelopment/utils/constants.dart';

@RoutePage()
class EnterLocationScreen extends StatefulWidget {
  const EnterLocationScreen({super.key});

  @override
  State<EnterLocationScreen> createState() => _EnterLocationScreenState();
}

class _EnterLocationScreenState extends State<EnterLocationScreen> {
  final map_ctrl.MapController _mapController = map_ctrl.MapController();
  bool useCurrentLocation = false;
  List<String> placePredictions = [];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      // Permission granted, proceed with location-related functionality
    } else if (status.isDenied) {
      // Permission denied, show a message to the user
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied, open app settings
      openAppSettings();
    }
  }

  Future<void> placeAutoComplete(String query) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      'maps/api/place/autocomplete/json',
      {"input": query, "key": apiKey},
    );
    String? response = await NetworkUtiliti.fetchUrl(uri);

    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      setState(() {
        placePredictions = result.predictions!
            .map((p) => p.description)
            .where((description) => description != null)
            .cast<String>()
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is your location?'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!useCurrentLocation)
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search your location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  placeAutoComplete(value);
                },
              ),
            const SizedBox(height: 20),
            CheckboxListTile(
              value: useCurrentLocation,
              onChanged: (value) {
                setState(() {
                  useCurrentLocation = value ?? false;
                });
              },
              title: const Text("Use my current location"),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (!useCurrentLocation)
              Expanded(
                child: ListView.builder(
                  itemCount: placePredictions.length,
                  itemBuilder: (context, index) {
                    return LocationListTile(
                      location: placePredictions[index],
                      press: () {
                        // Handle location selection
                      },
                    );
                  },
                ),
              ),
            if (useCurrentLocation)
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: GoogleMap(
                    onMapCreated: _mapController.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _mapController.center,
                      zoom: 11.0,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement functionality to confirm location and proceed
                context.router.push(const BarberHomeRoute());
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const BarberHomeScreen(), // Change based on role
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Confirm Location'),
            ),
            const Divider(
              height: 4,
              thickness: 4,
              color: secondaryColor40LightTheme,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: placePredictions.length,
                itemBuilder: (context, index) {
                  return LocationListTile(
                    press: () {},
                    location: placePredictions[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
