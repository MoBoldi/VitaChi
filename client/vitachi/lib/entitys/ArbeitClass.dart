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
  setDauer (DateTime DateTime) {
    this.dauer = dauer;
  }

  String toStringStart() {
    return '$start';
  }
  String toStringStop() {
    return '$dauer';
  }

  Map<String, dynamic> toJson() {
    return {
      'start': toStringStart(),
      'dauer': toStringStop()
    };
  }

  @override
  String toString() {
    return 'Arbeit{start: $start, dauer: $dauer}';
  }

}