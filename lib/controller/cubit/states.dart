abstract class TodoStates{}

class InitialTodoStates extends TodoStates{}

class SuccessCreateTodoDatabaseState extends TodoStates{}

class SuccessInsertingIntoTodoDatabaseState extends TodoStates{}

class SuccessGettingDataFromDatabaseState extends TodoStates{}