import 'package:acourse/app/constant.dart';
import 'package:acourse/app/extentions.dart';
import 'package:acourse/data/response/response.dart';
import 'package:acourse/domain/model/models.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orZero() ?? Constants.zero,
        this?.name.orEmpty() ?? Constants.empty,
        this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contact toDomain() {
    return Contact(
        this?.phone.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain(), this?.contact.toDomain());
  }
}
