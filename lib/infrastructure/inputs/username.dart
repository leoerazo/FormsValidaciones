import 'package:formz/formz.dart';

enum UsernameError { empty, length }

class Username extends FormzInput<String, UsernameError> {
  //Call super.dirty to represent an unmodified form input
  const Username.pure() : super.pure('');

  //Call super.dirty to represent a modified form input
  const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UsernameError.empty) return 'El campo es requerido';
    if (displayError == UsernameError.length) return 'Minimo 6 caracters';

    return null;
  }

  //Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.length;

    return null;
  }
}
