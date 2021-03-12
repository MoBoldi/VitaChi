class ArbeitClass{
  var start;
  var stop;


  ArbeitClass(DateTime start, DateTime stop){
    this.start = start;
    this.stop = stop;
  }

  int getStart(){
    return this.start;
  }
  setStart (var start) {
    this.start = start;
  }

  int getStop(){
    return this.stop;
  }
  setStop (var stop) {
    this.stop = stop;
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'stop': stop
    };
  }

  @override
  String toString() {
    return 'Arbeit{start: $start, stop: $stop}';
  }

}