import 'dart:convert';

class Pagination {
    final int? currentPage;
    final int? nextPage;
    final int? previousPage;
    final int? totalItems;
    final int? totalPages;
  Pagination({
    this.currentPage,
    this.nextPage,
    this.previousPage,
    this.totalItems,
    this.totalPages,
  });

  Map<String, dynamic> toMap() {
    return {
      'currentPage': currentPage,
      'nextPage': nextPage,
      'previousPage': previousPage,
      'totalItems': totalItems,
      'totalPages': totalPages,
    };
  }

  factory Pagination.fromMap(Map<String, dynamic> map) {
    return Pagination(
      currentPage: map['currentPage']?.toInt(),
      nextPage: map['nextPage']?.toInt(),
      previousPage: map['previousPage']?.toInt(),
      totalItems: map['totalItems']?.toInt(),
      totalPages: map['totalPages']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pagination.fromJson(String source) => Pagination.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pagination(currentPage: $currentPage, nextPage: $nextPage, previousPage: $previousPage, totalItems: $totalItems, totalPages: $totalPages)';
  }
}
