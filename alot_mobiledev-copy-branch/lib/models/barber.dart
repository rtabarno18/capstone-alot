class Barber {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final List<String> skills;
  final double rating;
  final Map<String, bool> availability;

  Barber({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.skills,
    this.rating = 0.0,
    required this.availability,
  });

  factory Barber.fromJson(Map<String, dynamic> json) {
    return Barber(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      skills: List<String>.from(json['skills']),
      rating: json['rating'].toDouble(),
      availability: Map<String, bool>.from(json['availability']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'skills': skills,
      'rating': rating,
      'availability': availability,
    };
  }
}
