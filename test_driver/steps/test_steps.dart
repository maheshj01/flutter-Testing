import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidgets
    extends Given3WithWorld<String, String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, String input2, String input3) async {
    // TODO: implement executeStep
    final textinput1 = find.byValueKey(input1);
    final textinput2 = find.byValueKey(input2);
    final button = find.byValueKey(input3);
    await FlutterDriverUtils.isPresent(textinput1, world.driver);
    await FlutterDriverUtils.isPresent(textinput2, world.driver);
    await FlutterDriverUtils.isPresent(button, world.driver);
  }

  @override
  // TODO: implement pattern
  RegExp get pattern => RegExp(r"I have {string} and {string} and {string}");
}

class ClickLoginButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String loginbtn) async {
    // TODO: implement executeStep
    final loginfinder = find.byValueKey(loginbtn);
    await FlutterDriverUtils.tap(world.driver, loginfinder);
  }

  @override
  RegExp get pattern => RegExp(r"I tap the {string} button");
}

class CheckIfHomePageIsPresent extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    // TODO: implement executeStep
    final homefinder = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent(homefinder, world.driver);
    // await FlutterDriverUtils.waitForFlutter(world.driver);
  }

  @override
  // TODO: implement pattern
  RegExp get pattern => RegExp("I should have {string} on screen");
}

class TapThumbUpButtonNTimes extends When2WithWorld<String, int, FlutterWorld> {
  @override
  Future<void> executeStep(String input1, int n) async {
    // TODO: implement executeStep
    final buttonfinder = find.byValueKey(input1);
    for (var i = 0; i < n; i++) {
      await FlutterDriverUtils.tap(world.driver, buttonfinder);
    }
  }

  @override
  // TODO: implement pattern
  RegExp get pattern => RegExp(r"I tap {string} button {int} times");
}

// class TapThumbDownButtonNTimes
//     extends When2WithWorld<String, int, FlutterWorld> {
//   @override
//   Future<void> executeStep(String input1, int n) async {
//     // TODO: implement executeStep
//     final buttonfinder = find.byValueKey(input1);
//     for (var i = 0; i < n; i++) {
//       await FlutterDriverUtils.tap(world.driver, buttonfinder);
//     }
//   }

//   @override
//   // TODO: implement pattern
//   RegExp get pattern => RegExp(r"I tap {string} button {int} times");
// }

class MakeFavourates extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    // TODO: implement
    for (var i = 0; i < 4; i++) {
      var buttonfinder = find.byValueKey(input1);
      await FlutterDriverUtils.tap(world.driver, buttonfinder);
      input1 = "like" + (i + 1).toString();
    }
  }

  @override
  // TODO: implement pattern
  RegExp get pattern => RegExp(r"I tap {string} button");
}

class TapFavouratePage extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    // TODO: implement executeStep
    final fav_finder = find.byValueKey(input1);
    await FlutterDriverUtils.tap(world.driver, fav_finder);
  }

  @override
  // TODO: implement pattern
  RegExp get pattern => RegExp(r"Then I tap {string} page");
}
