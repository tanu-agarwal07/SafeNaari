import 'package:flutter/material.dart';
import 'package:safenaari/Model/job_fetch_model.dart';
import 'package:safenaari/Model/ngo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/api.dart';

class JobProvider with ChangeNotifier{

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController hour = TextEditingController();

  var ngoId;

  bool addLoader = false,fetchJob = false,fetchNgo = false;

  List<Result> ngoListClass = [];
  List<JobData> jobListClass = [];

  updateAddLoader(bool load){
    addLoader = load;
    notifyListeners();
  }

  updateJobListLoader(bool load){
    fetchJob = load;
    notifyListeners();
  }

  updateNgoListLoader(bool load){
    fetchNgo = load;
    // notifyListeners();
  }

  setNgoList(List<Result> listClass){
    ngoListClass = listClass;
    notifyListeners();
  }

  setJobList(List<JobData> listClass){
    jobListClass = listClass;
    notifyListeners();
  }

  Future addJobApi() async{
    updateAddLoader(true);
    print('add');
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString('userId');
    print(id);

    var body = {
      'userid' : id,
      'title' : title.text,
      'desc' : description.text,
      'price' : price.text,
      'hour' : hour.text,
      'ngo_name' : ngoId.toString()
    };
    print(body);
    var res = Api.addJob(body);
    updateAddLoader(false);
    return res;
  }

  Future ngoListApi()async{
    print('ng21');
    updateNgoListLoader(true);
    var res = await Api.ngoFetch();
    print(res.result);
    setNgoList(res.result!);
    updateNgoListLoader(false);
  }

  Future jobListApi(id)async{
    print('ng21');
    updateJobListLoader(true);
    var res = await Api.jobFetch(id);
    setJobList(res.data!);
    updateJobListLoader(false);
  }

}