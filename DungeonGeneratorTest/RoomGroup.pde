class RoomGroup {
  ArrayList<Room> group = new ArrayList<Room>();

  void detectRelation(int r) {

    if ( room.get(room.get(room.get(r).nr).nr).equals(room.get(r)) ) { //if my nearest's nearest it's me
      group.add(room.get(room.get(r).nr));                             //then add my nearest 
    } else {                                                           //else:
      group.add(room.get(r));                                          //add myself
    }
  }




  RoomGroup() {
  }
}