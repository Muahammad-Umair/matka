//
// class Deposit {
//   Future<void> depositbalance(
//       {required String transactionId,
//       required String amount,
//       required String mode,
//       required BuildContext context}) async {
//     try {
//       Uri url = Uri.parse(Api.deposit);
//       String token = await sharedPreferences.getString('token') ?? '';
//       http.Response response = await http.post(
//         url,
//         body: {
//           'transection_id': transactionId,
//           'amount': amount,
//           "mode": mode,
//         },
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var data = await jsonDecode(response.body);
//         bool status = data['status'];
//         print(data);
//         showSnackBar(
//           context: context,
//           message: data['message'],
//           error: status ? false : true,
//         );
//       }
//     } catch (e) {
//       showSnackBar(context: context, message: e.toString(), error: true);
//     }
//   }
// }
