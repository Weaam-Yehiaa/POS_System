import 'package:equatable/equatable.dart';

class BaseResponse extends Equatable {
   int? code;
   String? description;

   BaseResponse({
     this.code,
     this.description,
  });

   factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      code: int.parse(json["code"]),
      description: json["description"],
    );

  }

   Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "description": this.description,
    };
  }

  @override
  List<Object?> get props => [code,description];
}