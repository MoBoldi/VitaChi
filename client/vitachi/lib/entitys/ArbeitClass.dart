class ArbeitClass{
  String start;
  DateTime dauer;


  ArbeitClass(String start, DateTime dauer){
    this.start = start;
    this.dauer = dauer;
  }

  String getStart(){
    return this.start;
  }
  setStart (String start) {
    this.start = start;
  }

  DateTime getDauer(){
    return this.dauer;
  }
  setDauer (DateTime DateTime) {
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
      'start': start,
      'dauer': toStringDauer(dauer)
    };
  }

  @override
  String toString() {
    return 'Arbeit{start: $start, dauer: $dauer}';
  }

}