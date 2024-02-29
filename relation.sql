CREATE TABLE assignment (
  id int,
  startDate timestamp,
  endDate timestamp,
  configID int,
  isVisible boolean,
  PRIMARY KEY(id)
);

CREATE TABLE assignmentConfig (
  id int,
  maxRam int,
  maxCPU float,
  maxTime timestamp,
  PRIMARY KEY(id)
);

CREATE TABLE student (
  id int,
  name VARCHAR(64),
  password VARCHAR(64),
  username VARCHAR(64),
  PRIMARY KEY(id)
);

CREATE TABLE admin (
  id int,
  name VARCHAR(64),
  password VARCHAR(64),
  username VARCHAR(64),
  PRIMARY KEY(id)
);

CREATE TABLE studentToAssignment (
  assignment int,
  student int,
  submission int,
  FOREIGN KEY(assignment) REFERENCES assignment(id),
  FOREIGN KEY(student) REFERENCES student(id),
  FOREIGN KEY(submission) REFERENCES submission(id)
);

CREATE TABLE submission (
  id int,
  grade VARCHAR(64),
  status VARCHAR(64),
  submission BYTEA,
  submissionStd VARCHAR(64),
  submissionErr VARCHAR(64),
  PRIMARY KEY(id)
);

CREATE TABLE teacherTo (
  assignment int,
  student int,
  FOREIGN KEY(assignment) REFERENCES assignment(id),
  FOREIGN KEY(student) REFERENCES student(id)
);

