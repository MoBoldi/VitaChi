import 'dart:io';

class AccessoirePlatz {
  int ap_id;
  int benutzer_id;
  int slot_it;
  int accessoire_id;

  AccessoirePlatz(int ap_id, int benutzer_id, int slot_it, int accessoire_id) {
    this.ap_id = ap_id;
    this.benutzer_id = benutzer_id;
    this.slot_it = slot_it;
    this.accessoire_id = accessoire_id;
  }

  int getAp_id() {
    return ap_id;
  }

  setAp_id(int ap_id) {
    this.ap_id = ap_id;
  }

  int getBenutzer_id() {
    return benutzer_id;
  }

  setBenutzer_id(int Benutzer_id) {
    this.benutzer_id = benutzer_id;
  }

  int getSlot_it() {
    return slot_it;
  }

  setSlot_it(int slot_it) {
    this.slot_it = slot_it;
  }

  int getAccessoire_id() {
    return accessoire_id;
  }

  setAccessoire_id(int accessoire_id) {
    this.accessoire_id = accessoire_id;
  }

  Map<String, dynamic> toJson() {
    return {
      'ap_id': ap_id,
      'benutzer_id': benutzer_id,
      'slot_it': slot_it,
      'accessoire_id': accessoire_id
    };
  }

  factory AccessoirePlatz.fromJson(Map<String, dynamic> json) {
    return AccessoirePlatz(
        json['ap_id'],
        json['benutzer_id'],
        json['slot_it'],
        json['accessoire_id']
    );
  }

  @override
  String toString() {
    return 'AccessoirePlatz{ap_id: $ap_id, benutzer_id: $benutzer_id, slot_it: $slot_it, accessoire_id: $accessoire_id}';
  }
}