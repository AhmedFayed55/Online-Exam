sealed class EditProfileEvent {}

class GetUserDataEvent extends EditProfileEvent {}

class ChangePasswordEvent extends EditProfileEvent {}

class EditProfileEventWhenSubmit extends EditProfileEvent {}
