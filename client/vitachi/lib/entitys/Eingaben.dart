class Eingaben{
  double eingabe1;
  double eingabe2;
  String typ = "Essen";


  Eingaben(double eingabe1, double eingabe2){
      this.eingabe1 = eingabe1;
      this.eingabe2 = eingabe2;
  }
  double getEingabe1(){
    return eingabe1;
  }
  double getEingabe2(){
    return eingabe2;
  }
  setEingabe1 (double e1) {
    this.eingabe1 = e1;
  }

  setEingabe2 (double e2) {
    this.eingabe2 = e2;
  }
  setAvg(){
    return (eingabe1+eingabe2)/2;
  }


  Map<String, dynamic> toJson() {
    return {
      '1': eingabe1,
      '2': eingabe2,
      '3': typ
    };
  }



  @override
  String toString() {
    return 'Eingaben{eingabe1: $eingabe1, eingabe2: $eingabe2}';
  }
}