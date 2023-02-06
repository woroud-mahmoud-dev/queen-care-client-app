part of 'convert_to_company_cubit.dart';

abstract class ConvertToCompanyState {}

class ConvertToCompanyInitial extends ConvertToCompanyState {}
class ConvertToCompanySuccess extends ConvertToCompanyState {}
class ConvertToCompanyLoading extends ConvertToCompanyState {}
class ConvertToCompanyError extends ConvertToCompanyState {}
class ConvertToCompanyChangeType extends ConvertToCompanyState {}
