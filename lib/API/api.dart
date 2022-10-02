import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:safenaari/Model/job_fetch_model.dart';
import 'package:safenaari/Model/ngo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/blog_list_model.dart';
import '../Model/sos_list_model.dart';


class Api{

  static const baseUrl = "https://womensafety.cleverapps.io";
  // static const baseUrl = "https://pp33guzghh.us-east-2.awsapprunner.com";
  static Map<String, String>? header;

  static Future login(body) async{
    var uri = Uri.https('womensafety.cleverapps.io', '/api/login', body);
    print(uri);
    http.Response response = await http.get(uri);
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  static Future register(body) async{
    // var url = "$baseUrl/api/register";
    // var uri = Uri.https('womensafety.cleverapps.io', '/api/register', body);
    var uri = 'https://womensafety.cleverapps.io/api/register?name=tanu&mobile=123456789&email=tanu9@gmail.com&password=123456';
    print(uri);
    http.Response response = await http.get(Uri.parse(uri));
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  static Future<JobListModel> jobFetch(id) async{
    // var url = "$baseUrl/api/register";
    var body ={
      'ngo_name' : id.toString(),
    };
    var uri = Uri.https('womensafety.cleverapps.io', '/api/jobs_fetch',body);
    http.Response response = await http.get(uri);
    return JobListModel.fromJson(jsonDecode(response.body));
  }

  static Future<NgoListClass> ngoFetch() async{
    print('ngo1');
    // var url = "$baseUrl/api/register";
    var uri = Uri.https('womensafety.cleverapps.io', '/api/ngo');
    http.Response response = await http.get(uri);
    print(jsonDecode(response.body));
    return NgoListClass.fromJson(jsonDecode(response.body));
  }

  static Future addJob(body) async{
    // var url = "$baseUrl/api/register";
    var uri = Uri.https('womensafety.cleverapps.io', '/api/jobs',body);
    http.Response response = await http.get(uri);
    return jsonDecode(response.body);
  }

  //https://womensafety.cleverapps.io/api/sos

  static Future addSos(body) async{
    // var url = "$baseUrl/api/register";
    var uri = Uri.https('womensafety.cleverapps.io', '/api/sos',body);
    http.Response response = await http.post(uri);
    return jsonDecode(response.body);
  }

  static Future<SosListModel> fetchSos() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString('userId');
    var body = {
      'userid': id.toString()
    };
    // var url = "$baseUrl/api/register";
    var uri = Uri.https('womensafety.cleverapps.io', '/api/sos_fetch',body);
    print(uri);
    http.Response response = await http.get(uri);
    return SosListModel.fromJson(jsonDecode(response.body));
  }

  static Future<BlogListModel> blogList() async{
    var uri = Uri.https('womensafety.cleverapps.io', '/api/blogs');
    print(uri);
    http.Response response = await http.get(uri);
    return BlogListModel.fromJson(jsonDecode(response.body));
  }



}