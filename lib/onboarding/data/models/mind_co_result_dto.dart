



import '../../../auth/data/models/comessage_list.dart';

class BKCoResultDTO {
    final String classname;
    final List<dynamic>? data;
    final bool? withError;
    final List<ComessageList>? comessageList;
BKCoResultDTO({
    this.classname = "CoResultDTO",
    this.data,
    this.withError,
    this.comessageList,
  });

  
}


