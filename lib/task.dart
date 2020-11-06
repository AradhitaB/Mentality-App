class Task {
  String taskName;
  bool done = false;

  Task(this.taskName);
  getTask() => this.taskName;
  setTask(name) => this.taskName = name;

  isFinished() => this.done;
  setFinished(curr) => this.done = curr;
}