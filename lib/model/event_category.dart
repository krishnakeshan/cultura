class EventCategory {
  //Properties
  String objectId;
  String name;
  String imageURL;

  //Constructors
  EventCategory.fromMap({var map}) {
    print("making category from map ${map["name"]}");
    this.objectId = map["objectId"];
    this.name = map["name"];
    this.imageURL = map["imageURL"];
  }
}
