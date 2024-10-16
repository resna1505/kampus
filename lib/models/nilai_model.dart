class NilaiModel {
  final String? namamakul;
  final String? tahun;
  final String? semester;
  final String? idmakul;
  final String? semestermakul;
  final String? sksmakul;
  final String? simbol;
  final String? nilai;
  final String? name;
  final String? tugasindividu;

  NilaiModel({
    this.tahun,
    this.namamakul,
    this.semester,
    this.idmakul,
    this.semestermakul,
    this.sksmakul,
    this.simbol,
    this.nilai,
    this.name,
    this.tugasindividu,
  });

  factory NilaiModel.fromJson(Map<String, dynamic> json) => NilaiModel(
        tahun: json['TAHUN'],
        namamakul: json['NAMAMAKUL'],
        semester: json['SEMESTER'],
        idmakul: json['IDMAKUL'],
        semestermakul: json['SEMESTERMAKUL'],
        sksmakul: json['SKSMAKUL'],
        simbol: json['SIMBOL'],
        nilai: json['NILAI'],
        name: json['name'],
        tugasindividu: json['tugasindividu'],
      );
}
