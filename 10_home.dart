import 'dart:io';

// user regiester
// earn your money (including user money)
// 1 to 9
// win lose ( +2 -2)
// check user can play to continue if can

/// This class is guesses number between 0 and 9 if you are win you can get money
/// ```
final String a = "my name is jack";

/// ```
void main() {
  String? name;
  while (name == null) {
    print("Enter User Name :");
    String? username = stdin.readLineSync();
    List newData = username!.trim().split("");
    if (username != null && newData.length > 0) {
      name = newData.join();
      print('Step 1 : Welcome $name');
    }
  }

  int? balance;
  print("Enter Your Balance");
  balance = userdata();
  UserAccount.balance = balance;
  print('Step 2 : Your balance is $balance');

  late int userEarn;
  print("Enter Your Bet Amount");
  userEarn = userdata(bet: 'betting');

  late int guessNumber;
  print("Enter Your Guess Number");
  guessNumber = userdata(max: 9);

  final accounInfo =
      UserAccount(name: name, betAmount: userEarn, guessNumber: guessNumber);
  name = accounInfo.name;
  balance = UserAccount.balance;
  int bet = accounInfo.betAmount;
  int guessnumber = accounInfo.guessNumber;
  print("username     |  Balance    |  Bet Amount   | Guess Number");
  print(
      "$name             |  $balance        |          $bet  |     $guessnumber");
}

int userdata({int? max, String? bet}) {
  int? data;
  while (data == null) {
    String? inputData = stdin.readLineSync();
    String newInput = inputData!.trim();
    if (newInput != null && newInput != '') {
      int? intData = int.parse(newInput);
      if (intData != null && intData > 0) {
        if (bet != null) {
          if (UserAccount.balance < intData) {
            print("Balance is not enough");
          } else {
            data = intData;
          }
        } else {
          if (max != null) {
            if (intData == 0 || intData > max) {
              print("Guess Number Is Greater than 0 and less than $max number");
            } else {
              data = intData;
            }
          } else {
            data = intData;
          }
        }
      }
    } else {
      print("You can add number greate than 0 ");
    }
  }
  return data;
}

class UserAccount {
  //user name
  final String name;
  //user money
  static int balance = 0;
  //bet amount
  late int betAmount;
  //random guess number
  late int guessNumber;
  //play number
  bool? play;
  // earn money to user
  int? earn;
  UserAccount(
      {required String this.name,
      required int this.betAmount,
      required int this.guessNumber});
}
