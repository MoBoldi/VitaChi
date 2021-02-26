class Produkt{
  String beschreibung, bezeichnung, details, bildpfad;
  String preis;
  Produkt({
    this.beschreibung,
    this.bezeichnung,
    this.details,
    this.bildpfad,
    this.preis
});


  factory Produkt.fromJson(Map<String, dynamic> json) {
    return Produkt(
      bezeichnung: json["bezeichnung"] as String,
      beschreibung: json["beschreibung"] as String,
      preis: json["preis"] ,
      details: json["details"] as String,
      bildpfad: json["bildpfad"] as String
    );
  }
}