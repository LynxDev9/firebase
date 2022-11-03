class Brew {
  String name;
  String sugars;
  int strenght;
  Brew({required this.name, required this.sugars, required this.strenght});
// receiving data from server
  factory Brew.fromMap(map) {
    return Brew(
      name: map['name'],
      sugars: map['sugars'],
      strenght: map['strenght'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sugars': sugars,
      'strenght': strenght,
    };
  }
}
