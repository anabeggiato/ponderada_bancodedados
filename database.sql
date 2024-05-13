-- ---
-- Globals
-- ---

-- ---
-- Table 'Team'
-- ---

DROP TABLE IF EXISTS "Team";
		
CREATE TABLE "Team" (
  "id" SERIAL PRIMARY KEY,
  "teamName" TEXT,
  "id_Tutor" INTEGER
);

-- ---
-- Table 'Tutor'
-- ---

DROP TABLE IF EXISTS "Tutor";
		
CREATE TABLE "Tutor" (
  "id" SERIAL PRIMARY KEY,
  "id_user" TEXT,
  "id_education" INTEGER,
  "id_Team" INTEGER
);

-- ---
-- Table 'student'
-- ---

DROP TABLE IF EXISTS "student";
		
CREATE TABLE "student" (
  "id" SERIAL PRIMARY KEY,
  "birthday" DATE,
  "phonenumber" TEXT,
  "gender" VARCHAR,
  "nationality" TEXT,
  "nationality2" TEXT,
  "id_user" TEXT,
  "id_education" INTEGER
);

-- ---
-- Table 'user'
-- ---

DROP TABLE IF EXISTS "user";
		
CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "firstname" INTEGER,
  "lastname" INTEGER,
  "email" TEXT,
  "password" INTEGER,
  "type" VARCHAR
);

-- ---
-- Table 'questions'
-- ---

DROP TABLE IF EXISTS "questions";
		
CREATE TABLE "questions" (
  "id" SERIAL PRIMARY KEY,
  "question" TEXT,
  "id_questionaries" INTEGER
);

-- ---
-- Table 'questionaries'
-- ---

DROP TABLE IF EXISTS "questionaries";
		
CREATE TABLE "questionaries" (
  "id" SERIAL PRIMARY KEY,
  "questionary" INTEGER,
  "questionary_explanation" INTEGER,
  "id_question_category" INTEGER
);

-- ---
-- Table 'question_category'
-- ---

DROP TABLE IF EXISTS "question_category";
		
CREATE TABLE "question_category" (
  "id" SERIAL PRIMARY KEY,
  "categories" INTEGER,
  "id_answer_options" INTEGER
);

-- ---
-- Table 'education'
-- ---

DROP TABLE IF EXISTS "education";
		
CREATE TABLE "education" (
  "id" SERIAL PRIMARY KEY,
  "university" INTEGER,
  "country" INTEGER,
  "educationName" INTEGER,
  "educationLevel" INTEGER
);
-- ---
-- Table 'student_team'
-- ---

DROP TABLE IF EXISTS "student_team";
		
CREATE TABLE "student_team" (
  "id_student" INTEGER,
  "id_Team" INTEGER,
  PRIMARY KEY ("id_student", "id_Team"),
  FOREIGN KEY ("id_student") REFERENCES "student" ("id"),
  FOREIGN KEY ("id_Team") REFERENCES "Team" ("id")
);

-- ---
-- Table 'answer_options'
-- ---

DROP TABLE IF EXISTS "answer_options";
		
CREATE TABLE "answer_options" (
  "id" SERIAL PRIMARY KEY,
  "questionAnswer" INTEGER,
  "id_questions" INTEGER,
  "quantA" INTEGER,
  "quantB" INTEGER,
  FOREIGN KEY ("id_questions") REFERENCES "questions" ("id")
);

-- ---
-- Table 'answers'
-- ---

DROP TABLE IF EXISTS "answers";
		
CREATE TABLE "answers" (
  "id" SERIAL PRIMARY KEY,
  "id_user" INTEGER,
  "answer" INTEGER,
  "id_questions" INTEGER,
  FOREIGN KEY ("id_user") REFERENCES "user" ("id"),
  FOREIGN KEY ("id_questions") REFERENCES "questions" ("id")
);

-- ---
-- Table 'feedback'
-- ---

DROP TABLE IF EXISTS "feedback";
		
CREATE TABLE "feedback" (
  "id" SERIAL PRIMARY KEY,
  "id_user" INTEGER,
  "id_student" INTEGER,
  "feedback" CHAR,
  FOREIGN KEY ("id_user") REFERENCES "user" ("id"),
  FOREIGN KEY ("id_student") REFERENCES "student" ("id")
);

-- ---
-- Table 'profile'
-- ---

DROP TABLE IF EXISTS "profile";
		
CREATE TABLE "profile" (
  "id" SERIAL PRIMARY KEY,
  "id_user" INTEGER,
  "id_answer_options" INTEGER,
  FOREIGN KEY ("id_user") REFERENCES "user" ("id"),
  FOREIGN KEY ("id_answer_options") REFERENCES "answer_options" ("id")
);

-- ---
-- Table 'tickets'
-- ---

DROP TABLE IF EXISTS "tickets";
		
CREATE TABLE "tickets" (
  "id" SERIAL PRIMARY KEY,
  "id_student" INTEGER,
  "id_user" INTEGER,
  "Conteúdo" INTEGER,
  FOREIGN KEY ("id_student") REFERENCES "student" ("id"),
  FOREIGN KEY ("id_user") REFERENCES "user" ("id")
);
