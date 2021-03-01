class Produkt{
  String beschreibung, bezeichnung, details, bildpfad;
  int preis;
  Produkt({
    this.beschreibung,
    this.bezeichnung,
    this.details,
    this.bildpfad,
    this.preis
});


  factory Produkt.fromJson(Map<String, dynamic> json) {
    return Produkt(
      bezeichnung: json["bezeichnung"],
      beschreibung: json["beschreibung"],
      preis: json["preis"],
      details: json["details"],
      bildpfad: json["bild_pfad"]
    );
  }
}