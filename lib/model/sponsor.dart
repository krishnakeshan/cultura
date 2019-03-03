class Sponsor {
  String imageURL;
  String name;

  //Constructors
  Sponsor.fromMap(var map) {
    this.imageURL = map["sponsorImage"];
    this.name = map["sponsorName"];
  }
}
