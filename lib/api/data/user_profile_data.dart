// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/api/data/umbrella.dart';
// ignore_for_file: depend_on_referenced_packages, unused_import, always_put_required_named_parameters_first, public_member_api_docs, avoid-referencing-discarded-variables, flutter_style_todos

import 'package:json_annotation/json_annotation.dart';

part 'user_profile_data.g.dart';

/// Личные данные авторизованного пользователя.
@JsonSerializable(includeIfNull: false)
class UserProfileData {
  /// Номер телефона пользователя
  @JsonKey(name: 'phone')
  final String phone;

  /// Флаг получения пуш-уведомлений | вернуть false, если shouldReceivePromoActionsInfo из ответа https://api-ru.iiko.services/#tag/Customers/paths/~1api~11~1loyalty~1iiko~1customer~1info/post = false/null
  @JsonKey(name: 'shouldReceivePromoActionsInfo')
  final bool shouldReceivePromoActionsInfo;

  /// Идентификатор пользователя
  @JsonKey(name: 'id')
  final String id;

  /// Дата рождения пользователя | вернуть null, если birthday из ответа https://api-ru.iiko.services/#tag/Customers/paths/~1api~11~1loyalty~1iiko~1customer~1info/post = null
  @JsonKey(name: 'birthday')
  final String? birthday;

  /// Почта пользователя | вернуть null, если email из ответа https://api-ru.iiko.services/#tag/Customers/paths/~1api~11~1loyalty~1iiko~1customer~1info/post = null
  @JsonKey(name: 'email')
  final String? email;

  /// Количество накопленных баллов пользователя.
  /// Источник iiko - walletBalances.[]balance, где walletBalances.[]type = 1 И walletBalances.[]name in "Кэшбек" из ответа https://api-ru.iiko.services/#tag/Customers/paths/~1api~11~1loyalty~1iiko~1customer~1info/post
  /// Вернуть null, если у у пользователя нет баллов (кол-во баллов = 0)
  @JsonKey(name: 'loyaltyBalance')
  final int? loyaltyBalance;

  /// Имя пользователя | вернуть null, если name из ответа https://api-ru.iiko.services/#tag/Customers/paths/~1api~11~1loyalty~1iiko~1customer~1info/post = null
  @JsonKey(name: 'name')
  final String? name;

  /// Количество заказов пользователя.
  /// !вернуть общее количество заказов по ВСЕМ организациям
  /// Вернуть null, если у пользователя нет заказов
  @JsonKey(name: 'numberOfOrders')
  final int? numberOfOrders;

  /// Личные данные авторизованного пользователя.
  const UserProfileData({
    required this.phone,
    required this.shouldReceivePromoActionsInfo,
    required this.id,
    this.birthday,
    this.email,
    this.loyaltyBalance,
    this.name,
    this.numberOfOrders,
  });

  /// Личные данные авторизованного пользователя.
  factory UserProfileData.fromJson(Map<String, dynamic> json) => _$UserProfileDataFromJson(json);

  /// To Json
  Map<String, dynamic> toJson() => _$UserProfileDataToJson(this);
}
