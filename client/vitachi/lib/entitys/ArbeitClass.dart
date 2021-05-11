class ArbeitClass{
  DateTime start;
  DateTime dauer;
  int userid;

  ArbeitClass(DateTime start, DateTime dauer, int userid){
    this.start = start;
    this.dauer = dauer;
    this.userid = userid;
  }

  DateTime getStart(){
    return this.start;
  }
  setStart (DateTime start) {
    this.start = start;
  }

  DateTime getDauer(){
    return this.dauer;
  }
  setDauer (DateTime dauer) {
    this.dauer = dauer;
  }

  int getUserid(){
    return this.userid;
  }
  setUserid(int userid){
    this.userid = userid;
  }

  String toStringStart(DateTime start) {
    return '$start';
  }
  String toStringDauer(DateTime dauer) {
    return '$dauer';
  }

  Map<String, dynamic> toJson() {
    return {
      'start': toStringStart(start),
      'dauer': toStringDauer(dauer),
      'userid': userid
    };
  }

  @override
  String toString() {
    return 'Arbeit{start: $start, dauer: $dauer, userid: $userid}';
  }

}