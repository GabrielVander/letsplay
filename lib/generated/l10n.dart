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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Explore`
  String get explorePageHeaderTitle {
    return Intl.message(
      'Explore',
      name: 'explorePageHeaderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Find people to play with`
  String get explorePageHeaderSubtitle {
    return Intl.message(
      'Find people to play with',
      name: 'explorePageHeaderSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `My followers`
  String get explorePageMyFollowersTabTitle {
    return Intl.message(
      'My followers',
      name: 'explorePageMyFollowersTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `New people`
  String get explorePageNewPeopleTabTitle {
    return Intl.message(
      'New people',
      name: 'explorePageNewPeopleTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cute gamer dog image`
  String get explorePageMyFollowersTabContentIllustrationLabel {
    return Intl.message(
      'Cute gamer dog image',
      name: 'explorePageMyFollowersTabContentIllustrationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Oops...`
  String get explorePageMyFollowersTabContentMessageTitle {
    return Intl.message(
      'Oops...',
      name: 'explorePageMyFollowersTabContentMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `You should be logged in to access this`
  String get explorePageMyFollowersTabContentMessageBody {
    return Intl.message(
      'You should be logged in to access this',
      name: 'explorePageMyFollowersTabContentMessageBody',
      desc: '',
      args: [],
    );
  }

  /// `Cute sleepy koala image`
  String get explorePageNewPeopleTabContentIllustrationLabel {
    return Intl.message(
      'Cute sleepy koala image',
      name: 'explorePageNewPeopleTabContentIllustrationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Oh no...`
  String get explorePageNewPeopleTabContentMessageTitle {
    return Intl.message(
      'Oh no...',
      name: 'explorePageNewPeopleTabContentMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `It seems no one is online. Help us grow by sharing the app with your friends!`
  String get explorePageNewPeopleTabContentMessageBody {
    return Intl.message(
      'It seems no one is online. Help us grow by sharing the app with your friends!',
      name: 'explorePageNewPeopleTabContentMessageBody',
      desc: '',
      args: [],
    );
  }

  /// `Cute programmer image`
  String get errorIllustrationLabel {
    return Intl.message(
      'Cute programmer image',
      name: 'errorIllustrationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Oh no...`
  String get errorMessageTitle {
    return Intl.message(
      'Oh no...',
      name: 'errorMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get errorMessageBody {
    return Intl.message(
      'Something went wrong',
      name: 'errorMessageBody',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get userStatusOnline {
    return Intl.message(
      'Online',
      name: 'userStatusOnline',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get userStatusOffline {
    return Intl.message(
      'Offline',
      name: 'userStatusOffline',
      desc: '',
      args: [],
    );
  }

  /// `Playing`
  String get userStatusPlaying {
    return Intl.message(
      'Playing',
      name: 'userStatusPlaying',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get userStatusUnknown {
    return Intl.message(
      'Unknown',
      name: 'userStatusUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Status: `
  String get userDisplayStatusLabel {
    return Intl.message(
      'Status: ',
      name: 'userDisplayStatusLabel',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get genericErrorLabel {
    return Intl.message(
      'Error',
      name: 'genericErrorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get singUpButton {
    return Intl.message(
      'Sign up',
      name: 'singUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message(
      'Email',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Cute dog with milkshake image`
  String get loginPageIllustrationLabel {
    return Intl.message(
      'Cute dog with milkshake image',
      name: 'loginPageIllustrationLabel',
      desc: '',
      args: [],
    );
  }

  /// `New user? Create account`
  String get loginPagerNewUser {
    return Intl.message(
      'New user? Create account',
      name: 'loginPagerNewUser',
      desc: '',
      args: [],
    );
  }

  /// `Please fill this field`
  String get loginPagerGenericEmptyField {
    return Intl.message(
      'Please fill this field',
      name: 'loginPagerGenericEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get authUserNotFound {
    return Intl.message(
      'User not found',
      name: 'authUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get authWrongPassword {
    return Intl.message(
      'Wrong password',
      name: 'authWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Logged in successfully`
  String get authLoggedInSuccessfully {
    return Intl.message(
      'Logged in successfully',
      name: 'authLoggedInSuccessfully',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
