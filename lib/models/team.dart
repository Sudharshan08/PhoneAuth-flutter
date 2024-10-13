import 'dart:ffi';

class Team{
  final String id;
  final String name;
  final String type;
  final String severity;
  final String reportedBy;
  final String createdOn;
  final String resolvedOn;
  final bool status;
  final Object stage;
  final int uniqueId;

  Team({
    required this.id,
     required this.name,
      required this.type,
       required this.severity,
        required this.reportedBy,
         required this.resolvedOn,
          required this.createdOn,
           required this.status,
            required this.stage,
             required this.uniqueId,
  });


  
}