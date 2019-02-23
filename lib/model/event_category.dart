class EventCategory {
  //Properties
  String objectId;
  String name;

  //Constructors
  EventCategory.fromMap({var map}) {
    print("making category from map ${map["name"]}");
    this.objectId = map["objectId"];
    this.name = map["name"];
  }
}
