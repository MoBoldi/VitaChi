class Eingaben {
  double eingabe1;
  double eingabe2;
  String typ;
  DateTime date;
  int userid;

  Eingaben(double eingabe1, double eingabe2, String typ, int userid) {
    this.eingabe1 = eingabe1;
    this.eingabe2 = eingabe2;
    this.typ = typ;
    this.userid = userid;
  }

  DateTime getDate() {
    return date;
  }

  void setDate(String datum) {
    date = DateTime.parse(datum + " 00:00:00");
  }

  void setUserid(int userid) {
    this.userid = userid;
  }

  int getUserid() {
    return userid;
  }

  double getEingabe1() {
    return eingabe1;
  }

  double getEingabe2() {
    return eingabe2;
  }

  String getTyp() {
    return typ;
  }

  setEingabe1(double e1) {
    this.eingabe1 = e1;
  }

  setEingabe2(double e2) {
    this.eingabe2 = e2;
  }

  setTyp(String typ) {
    this.typ = typ;
  }

  setAvg() {
    return (eingabe1 + eingabe2) / 2;
  }

  Map<String, dynamic> toJson() {
    return {'bewertung1': eingabe1, 'bewertung2': eingabe2, 'typ': typ, 'userid':userid};
  }

  factory Eingaben.fromJson(Map<String, dynamic> json) {
    var e = Eingaben(
      json["bewertung1"],
      json["bewertung2"],
      json["typ"],
      json["userid"]
    );
    e.setDate(json["datum"]);
    return e;
  }

  @override
  String toString() {
    return 'Eingaben{eingabe1: $eingabe1, eingabe2: $eingabe2}';
  }
}
