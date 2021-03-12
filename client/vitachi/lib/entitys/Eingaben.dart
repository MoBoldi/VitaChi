class Eingaben{
  double eingabe1;
  double eingabe2;
  String typ;


  Eingaben(double eingabe1, double eingabe2, String typ){
      this.eingabe1 = eingabe1;
      this.eingabe2 = eingabe2;
      this.typ = typ;
  }

  double getEingabe1(){
    return eingabe1;
  }
  double getEingabe2(){
    return eingabe2;
  }
  String getTyp(){
    return typ;
  }
  setEingabe1 (double e1) {
    this.eingabe1 = e1;
  }

  setEingabe2 (double e2) {
    this.eingabe2 = e2;
  }
  setTyp (String typ) {
    this.typ = typ;
  }
  setAvg(){
    return (eingabe1+eingabe2)/2;
  }


  Map<String, dynamic> toJson() {
    return {
      'bewertung1': eingabe1,
      'bewertung2': eingabe2,
      'typ': typ
    };
  }



  @override
  String toString() {
    return 'Eingaben{eingabe1: $eingabe1, eingabe2: $eingabe2}';
  }
}