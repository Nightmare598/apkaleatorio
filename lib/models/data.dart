import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.random,
        this.dataTime,
    });

    int random;
    DateTime dataTime;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        random: json["Random"],
        dataTime: DateTime.parse(json["DataTime"]),
    );

    Map<String, dynamic> toJson() => {
        "Random": random,
        "DataTime": dataTime.toIso8601String(),
    };
}
