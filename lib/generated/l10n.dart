// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Connection`
  String get connection {
    return Intl.message(
      'Connection',
      name: 'connection',
      desc: '',
      args: [],
    );
  }

  /// `Inscription`
  String get inscription {
    return Intl.message(
      'Inscription',
      name: 'inscription',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `New task`
  String get newTask {
    return Intl.message(
      'New task',
      name: 'newTask',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Deadline`
  String get deadline {
    return Intl.message(
      'Deadline',
      name: 'deadline',
      desc: '',
      args: [],
    );
  }

  /// `Select deadline`
  String get selectDeadline {
    return Intl.message(
      'Select deadline',
      name: 'selectDeadline',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message(
      'Detail',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Select an image`
  String get selectImage {
    return Intl.message(
      'Select an image',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `{percentage}% done`
  String percentageDoneHome(int percentage) {
    return Intl.message(
      '$percentage% done',
      name: 'percentageDoneHome',
      desc: '',
      args: [percentage],
    );
  }

  /// `Percentage done:`
  String get percentageDoneDetail {
    return Intl.message(
      'Percentage done:',
      name: 'percentageDoneDetail',
      desc: '',
      args: [],
    );
  }

  /// `{percentage}% of time elapsed`
  String timeElapsed(double percentage) {
    return Intl.message(
      '$percentage% of time elapsed',
      name: 'timeElapsed',
      desc: '',
      args: [percentage],
    );
  }

  /// `You need to enter a username`
  String get usernameValidation {
    return Intl.message(
      'You need to enter a username',
      name: 'usernameValidation',
      desc: '',
      args: [],
    );
  }

  /// `You need to enter a password`
  String get passwordValidation {
    return Intl.message(
      'You need to enter a password',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `You need to confirm your password`
  String get confirmPasswordValidation {
    return Intl.message(
      'You need to confirm your password',
      name: 'confirmPasswordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Your confirmation isn't like your password`
  String get samePasswordValidation {
    return Intl.message(
      'Your confirmation isn\'t like your password',
      name: 'samePasswordValidation',
      desc: '',
      args: [],
    );
  }

  /// `The task need a name`
  String get nameValidation {
    return Intl.message(
      'The task need a name',
      name: 'nameValidation',
      desc: '',
      args: [],
    );
  }

  /// `An error as occurred`
  String get globalError {
    return Intl.message(
      'An error as occurred',
      name: 'globalError',
      desc: '',
      args: [],
    );
  }

  /// `MMMM dd y`
  String get dateFormat {
    return Intl.message(
      'MMMM dd y',
      name: 'dateFormat',
      desc: '',
      args: [],
    );
  }

  /// `Your password or username is wrong`
  String get badCredentials {
    return Intl.message(
      'Your password or username is wrong',
      name: 'badCredentials',
      desc: '',
      args: [],
    );
  }

  /// `La tâche n'a pas été trouvé`
  String get taskNotFound {
    return Intl.message(
      'La tâche n\'a pas été trouvé',
      name: 'taskNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Your username is too short`
  String get usernameTooShort {
    return Intl.message(
      'Your username is too short',
      name: 'usernameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `your password is too short`
  String get passwordTooShort {
    return Intl.message(
      'your password is too short',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `this username is already taken`
  String get usernameAlreadyTaken {
    return Intl.message(
      'this username is already taken',
      name: 'usernameAlreadyTaken',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
