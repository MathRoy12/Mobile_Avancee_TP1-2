// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(percentage) => "${percentage}% done";

  static String m1(percentage) => "${percentage}% of time elapsed";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "confirmPasswordValidation": MessageLookupByLibrary.simpleMessage(
            "You need to confirm your password"),
        "connection": MessageLookupByLibrary.simpleMessage("Connection"),
        "dateFormat": MessageLookupByLibrary.simpleMessage("MMMM dd y"),
        "deadline": MessageLookupByLibrary.simpleMessage("Deadline"),
        "detail": MessageLookupByLibrary.simpleMessage("Detail"),
        "globalError":
            MessageLookupByLibrary.simpleMessage("An error as occurred"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "inscription": MessageLookupByLibrary.simpleMessage("Inscription"),
        "logout": MessageLookupByLibrary.simpleMessage("Log out"),
        "name": MessageLookupByLibrary.simpleMessage("name"),
        "nameValidation":
            MessageLookupByLibrary.simpleMessage("The task need a name"),
        "newTask": MessageLookupByLibrary.simpleMessage("New task"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordValidation": MessageLookupByLibrary.simpleMessage(
            "You need to enter a password"),
        "percentageDoneDetail":
            MessageLookupByLibrary.simpleMessage("Percentage done:"),
        "percentageDoneHome": m0,
        "samePasswordValidation": MessageLookupByLibrary.simpleMessage(
            "Your confirmation isn\'t like your password"),
        "selectDeadline":
            MessageLookupByLibrary.simpleMessage("Select deadline"),
        "timeElapsed": m1,
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "usernameValidation":
            MessageLookupByLibrary.simpleMessage("You need to enter a username")
      };
}
