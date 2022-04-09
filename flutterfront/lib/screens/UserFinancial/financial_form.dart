import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterfront/componets/usernavigationdrawer.dart';
import 'package:flutterfront/screens/UserFinancial/financialIssues.dart';
import 'package:flutterfront/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FinanceFormPage extends StatefulWidget {
  FinanceFormPage({Key? key}) : super(key: key);

  final FinancialIssuesService financialIssuesService =
      FinancialIssuesService();

  @override
  _FinanceFormPageState createState() => _FinanceFormPageState();
}

class _FinanceFormPageState extends State<FinanceFormPage> {
  final _financeFormKey = GlobalKey<FormState>();
  FinanceInsert insertFinance = FinanceInsert();
  int _selected = 0;
  String? errorText;
  bool validate = false;
  bool circular = false;

  final _monthlyIncomeController = TextEditingController();
  final _monthlyExpenditureController = TextEditingController();
  final _bankLoanInstallmentController = TextEditingController();
  final _loanDuration = TextEditingController();

  @override
  void onChange(int value) {
    setState(() {
      _selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget formSection = Form(
      key: _financeFormKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _monthlyIncomeController,
              decoration: const InputDecoration(
                hintText: "Monthly Income",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please input your monthly income";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
            child: TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _monthlyExpenditureController,
              decoration: const InputDecoration(
                hintText: "Monthly Expenditure",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please input your monthly expenditure";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
            child: TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _bankLoanInstallmentController,
              decoration: const InputDecoration(
                hintText: "Bank Loan Installment",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please input bank loan installment";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
            child: TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _loanDuration,
              decoration: const InputDecoration(
                hintText: "Loan Duration",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please input loan duration";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple.shade300,
                fixedSize: const Size(300, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (_financeFormKey.currentState!.validate() || validate) {
                  Map<String, String> data = {
                    "monthlyIncome": _monthlyIncomeController.text,
                    "monthlyExpenditure": _monthlyExpenditureController.text,
                    "bankLoanInstallment": _bankLoanInstallmentController.text,
                    "loanDuration": _loanDuration.text
                  };
                  print(data);
                  var result = insertFinance.post(
                      "/financialDetails/addFinancialIssues", data);
                  if (result == null) {
                    Fluttertoast.showToast(
                        msg: "Unsuccessfull",
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 20,
                        backgroundColor: Colors.red);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Save Successfully", // message
                        toastLength: Toast.LENGTH_LONG,
                        fontSize: 20,
                        backgroundColor: Colors.green // duration
                        );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FniancialIssuesInFive()),
                    );
                  }
                } else {
                  Fluttertoast.showToast(
                      msg: "Please Fill all Fields", // message
                      toastLength: Toast.LENGTH_LONG,
                      fontSize: 20,
                      backgroundColor: Colors.red // duration
                      );
                }
              },
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
        // drawer: NevigationDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 135, 63, 243),
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "Financial Issues",
                style: TextStyle(
                    fontSize: 24.0, color: Color.fromARGB(215, 255, 255, 255)),
              ),
            ),
            iconTheme:
                const IconThemeData(color: Color.fromARGB(255, 247, 213, 255)),
          ),
        ),
        body: Container(
          height: double.maxFinite,
          padding: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/familyback.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              formSection,
            ],
          ),
        ));
  }
}
