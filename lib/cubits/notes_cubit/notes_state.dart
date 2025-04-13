part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccess extends NotesState {
  List<NoteModel> notes;
  NotesSuccess(this.notes);
}

final class NotesFailure extends NotesState {
  final String errMassege;
  NotesFailure(this.errMassege);
}
