// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(percentage) => "${percentage}% d\'effectuer";

  static String m1(percentage) => "${percentage}% du temps d\'écoulé";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "badCredentials": MessageLookupByLibrary.simpleMessage(
            "Votre nom d\'utilisateur ou votre mot de passe est mauvais"),
        "confirmPassword": MessageLookupByLibrary.simpleMessage(
            "Confirmez votre mot de passe"),
        "confirmPasswordValidation": MessageLookupByLibrary.simpleMessage(
            "Veuillez confirmé votre mot de passe"),
        "dateFormat": MessageLookupByLibrary.simpleMessage("dd MMMM y"),
        "deadline": MessageLookupByLibrary.simpleMessage("Échéance"),
        "detail": MessageLookupByLibrary.simpleMessage("Detail"),
        "globalError":
            MessageLookupByLibrary.simpleMessage("Une erreur c\'est produite"),
        "home": MessageLookupByLibrary.simpleMessage("Accueil"),
        "inscription": MessageLookupByLibrary.simpleMessage("Inscription"),
        "logout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
        "name": MessageLookupByLibrary.simpleMessage("nom"),
        "nameValidation":
            MessageLookupByLibrary.simpleMessage("La tache doit avoir un nom"),
        "newTask": MessageLookupByLibrary.simpleMessage("Nouvelle tâche"),
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "passwordTooShort": MessageLookupByLibrary.simpleMessage(
            "Votre mot de passe est trop court"),
        "passwordValidation": MessageLookupByLibrary.simpleMessage(
            "Veuillez écrire votre mot de passe"),
        "percentageDoneDetail":
            MessageLookupByLibrary.simpleMessage("Pourcentage effectué:"),
        "percentageDoneHome": m0,
        "samePasswordValidation": MessageLookupByLibrary.simpleMessage(
            "Votre confirmation n\'est pas comme votre mot de passe"),
        "selectDeadline":
            MessageLookupByLibrary.simpleMessage("Choisissez votre échéance"),
        "selectImage":
            MessageLookupByLibrary.simpleMessage("Sélectionner une image"),
        "taskNotFound":
            MessageLookupByLibrary.simpleMessage("The taks wasn\'t found"),
        "timeElapsed": m1,
        "username": MessageLookupByLibrary.simpleMessage("Nom d\'utilisateur"),
        "usernameAlreadyTaken": MessageLookupByLibrary.simpleMessage(
            "Ce nom d\'utilisateur est déjà pris"),
        "usernameTooShort": MessageLookupByLibrary.simpleMessage(
            "Votre nom d\'utilisateur est trop court"),
        "usernameValidation": MessageLookupByLibrary.simpleMessage(
            "Vous devez entrez un nom d\'utilisateur")
      };
}
