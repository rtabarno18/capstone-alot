import 'dart:convert';

import 'package:alot_mobiledevelopment/models/auto_complete_prediction.dart';

class PlaceAutocompleteResponse {
  final String? status;
  final List<AutocompletePrediction>? predictions;

  PlaceAutocompleteResponse({
    this.status,
    required this.predictions,
  });

  factory PlaceAutocompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompleteResponse(
      status: json['status'] as String?,
      predictions: json['predictions'] != null
          ? (json['predictions'] as List)
              .map((item) => AutocompletePrediction.fromJson(item))
              .toList()
          : [],
      //     .map<AutocompletePrediction>(
      //         (json) => AutocompletePrediction.fromJson(json))
      //     .toList()
      // : [],
    );
  }

  static PlaceAutocompleteResponse parseAutocompleteResult(
      String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();
    return PlaceAutocompleteResponse.fromJson(parsed);
  }
}
