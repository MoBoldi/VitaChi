class ArbeitClass{
  DateTime start;
  DateTime dauer;


  ArbeitClass(DateTime start, DateTime dauer){
    this.start = start;
    this.dauer = dauer;
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
    };
  }

  @override
  String toString() {
    return 'Arbeit{start: $start, dauer: $dauer}';
  }

}