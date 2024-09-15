part of 'get_model_answers_bloc.dart';

@immutable
sealed class GetModelAnswersEvent extends Equatable {}

class GetModelAnswersRequestEvent extends GetModelAnswersEvent {

  final int studentId;
  final int quizId;

  GetModelAnswersRequestEvent({
    required this.studentId,
    required this.quizId,
  });

  @override
  List<Object> get props => [studentId, quizId];
}
