import 'dart:convert';
import 'package:flutterfront/models/familyIssue.model.dart';
import 'package:flutterfront/models/financialIssue.model.dart';
import 'package:flutterfront/models/healthIssue.model.dart';
import 'package:flutterfront/models/socialIssue.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class FamilyIssuesService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<FamilyIssueModel>> getAll() async {
    final response =
        await http.get(Uri.parse(apiURL + '/familyIDetails/getAllIssues'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<FamilyIssueModel>((json) => FamilyIssueModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }

  insertIssues(FamilyIssueModel familyIssue) async {
    final response = await http.post(
      Uri.parse(apiURL + '/familyIDetails/insert'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(familyIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  updateIssue(FamilyIssueModel familyIssue) async {
    final response = await http.put(
      Uri.parse(apiURL + '/familyIDetails/' + (familyIssue.id).toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(familyIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  deleteIssue(FamilyIssueModel familyIssue) async {
    final response = await http.delete(
        Uri.parse(apiURL + '/familyIDetails/' + (familyIssue.id).toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class FamilyIssuesByService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<FamilyIssueModel>> getAll() async {
    final response =
        await http.get(Uri.parse(apiURL + '/familyIDetails/getIssuesaby'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<FamilyIssueModel>((json) => FamilyIssueModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class FamilyInsert {
  String baseurl = "http://10.0.2.2:8060";
  var log = Logger();
  Future<dynamic> get(String url) async {
    url = formaster(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formaster(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
  }

  String formaster(String url) {
    return baseurl + url;
  }
}

//Social Issues

class SocialIssuesService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<SocialIssueModel>> getAll() async {
    final response = await http.get(Uri.parse(apiURL + '/social/getAllIssues'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<SocialIssueModel>((json) => SocialIssueModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }

  insertIssues(SocialIssueModel socialIssue) async {
    final response = await http.post(
      Uri.parse(apiURL + '/social/insert'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(socialIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  updateIssue(SocialIssueModel socialIssue) async {
    final response = await http.put(
      Uri.parse(apiURL + '/social/' + (socialIssue.id).toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(socialIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  deleteIssue(SocialIssueModel socialIssue) async {
    final response = await http.delete(
        Uri.parse(apiURL + '/social/' + (socialIssue.id).toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class SocialIssuesByService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<SocialIssueModel>> getAll() async {
    final response = await http.get(Uri.parse(apiURL + '/social/getIssuesaby'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<SocialIssueModel>((json) => SocialIssueModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class SocialInsert {
  String baseurl = "http://10.0.2.2:8060";
  var log = Logger();
  Future<dynamic> get(String url) async {
    url = formaster(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formaster(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
  }

  String formaster(String url) {
    return baseurl + url;
  }
}

class FinancialIssuesService {
  String apiURL = 'http://10.0.2.2:8060';

  Future<List<AdminIssueModel>> getAll() async {
    final response = await http
        .get(Uri.parse(apiURL + '/financeIssuesDetails/getAdminIssue'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<AdminIssueModel>((json) => AdminIssueModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }

  insertFinancialIssues(AdminIssueModel adminIssue) async {
    final response = await http.post(
      Uri.parse(apiURL + '/financeIssuesDetails/addIssues'),
      headers: <String, String>{
        'Content-Type': 'application.json; charset=UTF-8',
      },
      body: jsonEncode(adminIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  updateFinancialIssue(AdminIssueModel adminIssue) async {
    final response = await http.put(
      Uri.parse(apiURL + '/financeIssuesDetails/' + (adminIssue.id).toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(adminIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  deleteFinancialIssue(AdminIssueModel adminIssue) async {
    final response = await http.delete(
        Uri.parse(
            apiURL + '/financeIssuesDetails/' + (adminIssue.id).toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class FinanceInsert {
  String baseurl = "http://10.0.2.2:8060";
  var log = Logger();
  Future<dynamic> get(String url) async {
    url = formaster(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formaster(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
  }

  String formaster(String url) {
    return baseurl + url;
  }
}

//Health
class HealthInsert {
  String baseurl = "http://10.0.2.2:8060";
  var log = Logger();
  Future<dynamic> get(String url) async {
    url = formaster(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formaster(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
  }

  String formaster(String url) {
    return baseurl + url;
  }
}

class HealthIssuesService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<HealthIssueModel>> getAll() async {
    final response = await http
        .get(Uri.parse(apiURL + '/healthIssueDetails/getAllHealthIssues'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<HealthIssueModel>((json) => HealthIssueModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }

  insertIssues(HealthIssueModel healthIssue) async {
    final response = await http.post(
      Uri.parse(apiURL + '/healthIssueDetails/insert'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(healthIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  updateIssue(HealthIssueModel healthIssue) async {
    final response = await http.put(
      Uri.parse(apiURL + '/healthIssueDetails/' + (healthIssue.id).toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(healthIssue.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }

  deleteIssue(HealthIssueModel healthIssue) async {
    final response = await http.delete(
        Uri.parse(
            apiURL + '/healthIssueDetails/' + (healthIssue.id).toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode != 200) {
      throw Exception('Error in: ' + response.body);
    }
  }
}

class HealthIssuesByService {
  String apiURL = 'http://10.0.2.2:8060'; // VERIFY IP

  Future<List<HealthIssueModel>> getAll() async {
    final response =
        await http.get(Uri.parse(apiURL + '/healthIssueDetails/getIssuesaby'));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<HealthIssueModel>((json) => HealthIssueModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Error in: ' + response.body);
    }
  }
}
