class ArbeitClass{
  DateTime start;
  DateTime stop;


  ArbeitClass(DateTime start, DateTime stop){
    this.start = start;
    this.stop = stop;
  }

  DateTime getStart(){
    return this.start;
  }
  setStart (DateTime start) {
    this.start = start;
  }

  DateTime getStop(){
    return this.stop;
  }
  setStop (DateTime stop) {
    this.stop = stop;
  }

  String toStringStart() {
    return '$start';
  }
  String toStringStop() {
    return '$stop';
  }

  Map<String, dynamic> toJson() {
    return {
      'start': toStringStart(),
      'stop': toStringStop()
    };
  }

  @override
  String toString() {
    return 'Arbeit{start: $start, stop: $stop}';
  }

}