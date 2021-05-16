import 'package:equatable/equatable.dart';

class AlQuran extends Equatable {
  final int number;
  final int sequence;
  final int numberOfVerses;
  final Name name;
  final Revelation revelation;
  final AlQuranTafsir tafsir;
  final dynamic preBismillah;
  final List<Verse> verses;

  AlQuran({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
    required this.preBismillah,
    required this.verses,
  });

  factory AlQuran.fromJson(Map<String, dynamic> json) => AlQuran(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromJson(json["name"]),
        revelation: Revelation.fromJson(json["revelation"]),
        tafsir: AlQuranTafsir.fromJson(json["tafsir"]),
        preBismillah: json["preBismillah"],
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
      );

  @override
  List<Object?> get props => [
        number,
        sequence,
        numberOfVerses,
        name,
        revelation,
        tafsir,
        preBismillah,
        verses
      ];
}

class Name {
  Name({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  final String short;
  final String long;
  final Translation transliteration;
  final Translation translation;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json["short"],
        long: json["long"],
        transliteration: Translation.fromJson(json["transliteration"]),
        translation: Translation.fromJson(json["translation"]),
      );
}

class Translation {
  Translation({
    required this.en,
    required this.id,
  });

  final String en;
  final String id;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
      );
}

class Revelation {
  Revelation({
    required this.arab,
    required this.en,
    required this.id,
  });

  final String arab;
  final String en;
  final String id;

  factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
      );
}

class AlQuranTafsir {
  AlQuranTafsir({
    required this.id,
  });

  final String id;

  factory AlQuranTafsir.fromJson(Map<String, dynamic> json) => AlQuranTafsir(
        id: json["id"],
      );
}

class Verse {
  Verse({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  final Number number;
  final Meta meta;
  final Text text;
  final Translation translation;
  final Audio audio;
  final VerseTafsir tafsir;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: Number.fromJson(json["number"]),
        meta: Meta.fromJson(json["meta"]),
        text: Text.fromJson(json["text"]),
        translation: Translation.fromJson(json["translation"]),
        audio: Audio.fromJson(json["audio"]),
        tafsir: VerseTafsir.fromJson(json["tafsir"]),
      );
}

class Audio {
  Audio({
    required this.primary,
    required this.secondary,
  });

  final String primary;
  final List<String> secondary;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        primary: json["primary"],
        secondary: List<String>.from(json["secondary"].map((x) => x)),
      );
}

class Meta {
  Meta({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  final int juz;
  final int page;
  final int manzil;
  final int ruku;
  final int hizbQuarter;
  final Sajda sajda;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: Sajda.fromJson(json["sajda"]),
      );
}

class Sajda {
  Sajda({
    required this.recommended,
    required this.obligatory,
  });

  final bool recommended;
  final bool obligatory;

  factory Sajda.fromJson(Map<String, dynamic> json) => Sajda(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );
}

class Number {
  Number({
    required this.inQuran,
    required this.inSurah,
  });

  final int inQuran;
  final int inSurah;

  factory Number.fromJson(Map<String, dynamic> json) => Number(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
      );
}

class VerseTafsir {
  VerseTafsir({
    required this.id,
  });

  final Id id;

  factory VerseTafsir.fromJson(Map<String, dynamic> json) => VerseTafsir(
        id: Id.fromJson(json["id"]),
      );
}

class Id {
  Id({
    required this.short,
    required this.long,
  });

  final String short;
  final String long;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        short: json["short"],
        long: json["long"],
      );
}

class Text {
  Text({
    required this.arab,
    required this.transliteration,
  });

  final String arab;
  final Transliteration transliteration;

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        arab: json["arab"],
        transliteration: Transliteration.fromJson(json["transliteration"]),
      );
}

class Transliteration {
  Transliteration({
    required this.en,
  });

  final String en;

  factory Transliteration.fromJson(Map<String, dynamic> json) =>
      Transliteration(
        en: json["en"],
      );
}
