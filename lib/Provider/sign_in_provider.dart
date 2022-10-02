import 'package:flutter/material.dart';
import 'package:safenaari/API/api.dart';
import 'package:safenaari/Model/blog_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/sos_list_model.dart';

class SignInProvider with ChangeNotifier{

  bool loginLoader = false, registerLoader = false,addSosLoader = false,
      sosListLoader = false,blogListLoader = false;

  TextEditingController name = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();

  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  String userName = '', userMobile = '', userEmail = '';

  List<SosResult> sosList = [];
  List<BlogResult> blogList = [];

  updateLoginLoader(bool load){
    loginLoader = load;
    notifyListeners();
  }

  updateAddSosLoader(bool load){
    addSosLoader = load;
    notifyListeners();
  }

  updateSosListLoader(bool load){
    sosListLoader = load;
  }

  updateBlogListLoader(bool load){
    blogListLoader = load;
  }

  setSosList(List<SosResult> list){
    sosList = list;
    notifyListeners();
  }

  setBlogList(List<BlogResult> list){
    blogList = list;
    notifyListeners();
  }

  updateRegisterLoader(bool load){
    registerLoader = load;
    notifyListeners();
  }

  Future loginApi() async{
    updateLoginLoader(true);
    var body = {
      'email' : signInEmail.text,
      'password' : signInPassword.text,
    };
    var res = Api.login(body);
    updateLoginLoader(false);
    return res;
  }

  Future addSosApi(name,mobile) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString('userId');
    print(id);
    updateAddSosLoader(true);
    var body = {
      'name' : name,
      'mobile' : mobile,
      'userid' : id.toString(),
    };
    var res = await Api.addSos(body);
    updateAddSosLoader(false);
    return res;
  }

  Future registerApi() async{
    updateRegisterLoader(true);
    var body = {
      'name' : name.text,
      'email' : signUpEmail.text,
      'mobile' : mobile.text,
      'password' : signUpPassword.text,
    };
    print(body);
    var res = await Api.register(body);
    updateRegisterLoader(false);
    return res;
  }

  Future sosListApi() async{
    updateSosListLoader(true);
    var res = await Api.fetchSos();
    setSosList(res.result!);
    updateSosListLoader(false);
    return res;
  }

  Future blogListApi() async{
    updateBlogListLoader(true);
    var res = await Api.blogList();
    setBlogList(res.result!);
    updateBlogListLoader(false);
    return res;
  }

  setUserData(name,mobile,email){
    userName = name;
    userMobile = mobile;
    userEmail = email;
    notifyListeners();
  }

}