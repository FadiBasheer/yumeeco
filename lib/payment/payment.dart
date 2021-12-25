import 'package:flutter/material.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:uuid/uuid.dart';
import 'dialog_modal.dart';
import 'transaction_service.dart';

class pay extends StatefulWidget {
  static String id = 'Payment';

  @override
  _payState createState() => _payState();
}

class _payState extends State<pay> {
  bool get _chargeServerHostReplaced => chargeServerHost != "REPLACE_ME";
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  final int cookieAmount = 2000;

  // void _CardNonceRequestSuccess(CardDetails result) {
  //   print(result.nonce);
  //   InAppPayments.completeCardEntry(onCardEntryComplete: _CardEntryComplete);
  // }
//void _CardEntryComplete() {}

  // void printCurlCommand(String nonce, String verificationToken) {
  //   var hostUrl = 'https://connect.squareup.com';
  //   if ("sandbox-sq0idb-sf8pm5TUAt-FWB4nzunPPw".startsWith('sandbox')) {
  //     hostUrl = 'https://connect.squareupsandbox.com';
  //   }
  //   var uuid = Uuid().v4();
  //
  //   if (verificationToken == null) {
  //     print('curl --request POST $hostUrl/v2/payments \\'
  //         '--header \"Content-Type: application/json\" \\'
  //         '--header \"Authorization: Bearer YOUR_ACCESS_TOKEN\" \\'
  //         '--header \"Accept: application/json\" \\'
  //         '--data \'{'
  //         '\"idempotency_key\": \"$uuid\",'
  //         '\"amount_money\": {'
  //         '\"amount\": $cookieAmount,'
  //         '\"currency\": \"CAD\"},'
  //         '\"source_id\": \"$nonce\"'
  //         '}\'');
  //   } else {
  //     print('curl --request POST $hostUrl/v2/payments \\'
  //         '--header \"Content-Type: application/json\" \\'
  //         '--header \"Authorization: Bearer YOUR_ACCESS_TOKEN\" \\'
  //         '--header \"Accept: application/json\" \\'
  //         '--data \'{'
  //         '\"idempotency_key\": \"$uuid\",'
  //         '\"amount_money\": {'
  //         '\"amount\": $cookieAmount,'
  //         '\"currency\": \"CAD\"},'
  //         '\"source_id\": \"$nonce\",'
  //         '\"verification_token\": \"$verificationToken\"'
  //         '}\'');
  //   }
  // }

  // void _showUrlNotSetAndPrintCurlCommand(String nonce,
  //     {String verificationToken}) {
  //   String title;
  //   if (verificationToken != null) {
  //     title = "Nonce and verification token generated but not charged";
  //   } else {
  //     title = "Nonce generated but not charged";
  //   }
  //   showAlertDialog(
  //       context: _payState.scaffoldKey.currentContext,
  //       title: title,
  //       description:
  //           "Check your console for a CURL command to charge the nonce, or replace CHARGE_SERVER_HOST with your server host.");
  //   printCurlCommand(nonce, verificationToken);
  // }

  void _onCardEntryComplete() {
    if (_chargeServerHostReplaced) {
      showAlertDialog(
          context: _payState.scaffoldKey.currentContext,
          title: "Your order was successful",
          description:
              "Go to your Square dashboard to see this order reflected in the sales tab.");
    }
  }

  void _CardNonceRequestSuccess(CardDetails result) async {
    // if (!_chargeServerHostReplaced) {
    //   InAppPayments.completeCardEntry(
    //       onCardEntryComplete: _onCardEntryComplete);
    //   _showUrlNotSetAndPrintCurlCommand(result.nonce);
    //   return;
    // }


    try {
      await chargeCard(result);
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
    } on ChargeException catch (ex) {
      InAppPayments.showCardNonceProcessingError(ex.errorMessage);
    }
  }

  void _CardEntryCancel() {}

  void pay() {
    InAppPayments.setSquareApplicationId(
        "sandbox-sq0idb-sf8pm5TUAt-FWB4nzunPPw");
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _CardNonceRequestSuccess,
      onCardEntryCancel: _CardEntryCancel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.yellow,
                      onPressed: () {
                        pay();
                      },
                      child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'pay',
                              style: TextStyle(fontSize: 25),
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
