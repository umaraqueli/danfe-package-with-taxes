import 'dart:convert';

import 'package:danfe/src/models/dup.dart';
import 'package:danfe/src/models/fat.dart';

/// Classe que representa as informações de cobrança da nota fiscal.
///
/// Baseada no elemento `<cobr>`.
class Cobr {
  /// Informações da fatura.
  Fat? fat;

  /// Informações das duplicatas.
  List<Dup>? dup;

  /// Construtor da classe [Cobr].
  ///
  /// Recebe:
  /// - [fat]: Informações da fatura.
  /// - [dup]: Lista de duplicatas.
  Cobr({
    this.fat,
    this.dup = const [],
  });

  /// Converte a instância de [Cobr] para um mapa.
  Map<String, dynamic> toMap() {
    return {
      'fat': fat?.toMap(),
      'dup': dup
          ?.map((d) => d?.toMap())
          .toList(), // Converte cada 'Dup' para um mapa
    };
  }

  /// Cria uma instância de [Cobr] a partir de um mapa.
  factory Cobr.fromMap(Map<String, dynamic> map) {
    return Cobr(
      fat: map['fat'] != null ? Fat.fromMap(map['fat']) : null,
      dup: map['dup'] != null
          ? (map['dup'] is List
              ? List<Dup>.from(map['dup'].map((item) => Dup.fromMap(item)))
              : [Dup.fromMap(map['dup'])])
          : [],
    );
  }

  /// Converte a instância de [Cobr] para uma string JSON.
  String toJson() => json.encode(toMap());

  /// Cria uma instância de [Cobr] a partir de uma string JSON.
  factory Cobr.fromJson(String source) => Cobr.fromMap(json.decode(source));
}
