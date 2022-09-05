import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject,this.body);

   factory Message.fromJson(Map<String, dynamic> json) 
 => _$MessageFromJson(json);

 static Future<List<Message>> browse() async{
   http.Response response = 
   await http.get(Uri.parse('https://run.mocky.io/v3/8b54ada5-d011-4643-a931-39d19b41dfc5'));
   
   await Future.delayed(Duration(seconds: 3));
   String content = response.body;
   List collection = json.decode(content);
   List<Message> _messages = 
      collection.map((json) => Message.fromJson(json)).toList();
   
  return _messages;
 }
}