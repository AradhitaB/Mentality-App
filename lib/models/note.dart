class Note {
  String title;
  String note;

  Note(this.title, this.note);
  getTitle() => this.title;
  setTitle(name, note){
    this.title = name;
    this.note = note;
  }

  getNote() => this.note;
  setNote(content) => this.note = content;
}