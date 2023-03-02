part of 'register_company_cubit.dart';

abstract class RegisterCompanyState {}

class CompleteCompanyInfoInitial extends RegisterCompanyState {}
class CompleteCompanyInfoSuccess extends RegisterCompanyState {}
class CompleteCompanyInfoLoading extends RegisterCompanyState {}
class CompleteCompanyInfoError extends RegisterCompanyState {}
class AddImageSuccess extends RegisterCompanyState {}
class AddImageError extends RegisterCompanyState {}
class CompleteCompanyInfoChangeType extends RegisterCompanyState {}
class DeviceNotConnectedState extends RegisterCompanyState {}
