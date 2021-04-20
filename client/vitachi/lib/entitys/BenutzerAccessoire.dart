import 'dart:io';

class BenutzerAccessoire{
  int UID;
  int PID;


  BenutzerAccessoire(int UID, int PID){
    this.UID=UID;
    this.PID=PID;
  }

  int getUID(){
    return UID;
  }
  int getPID(){
    return PID;
  }
  setUID (int uid) {
    this.UID = uid;
  }

  setPID (int pid) {
    this.PID = pid;
  }


  Map<String, dynamic> toJson() {
    return {
      'userID': UID,
      'accessoire': PID,
    };
  }



  @override
  String toString() {
    return 'Eingaben{eingabe1: $UID, eingabe2: $PID}';
  }
}