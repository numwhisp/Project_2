﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Coaches" (
    "coach_id" int   NOT NULL,
    "last_name" string   NOT NULL,
    "first_name" string   NOT NULL,
    "country_id" int   NOT NULL,
    "discipline_id" int   NOT NULL,
    "event_id" int,
    CONSTRAINT "pk_Coaches" PRIMARY KEY (
        "coach_id"
     )
);

CREATE TABLE "Athletes" (
    "athlete_id" int   NOT NULL,
    "last_name" string   NOT NULL,
    "first_name" money   NOT NULL,
    "country_id" int   NOT NULL,
    "discipline_id" int   NOT NULL,
    CONSTRAINT "pk_Athletes" PRIMARY KEY (
        "athlete_id"
     )
);

CREATE TABLE "Teams" (
    "team_id" int   NOT NULL,
    "name" string   NOT NULL,
    "country_id" int   NOT NULL,
    "discipline_id" in   NOT NULL,
    "event_id" int   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "team_id"
     )
);

CREATE TABLE "Medals" (
    "country_id" int   NOT NULL,
    "gold" int   NOT NULL,
    "total" int   NOT NULL,
    "rank" int   NOT NULL,
    "rank_by_total" int   NOT NULL,
    CONSTRAINT "pk_Medals" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "Countries" (
    "country_id" int   NOT NULL,
    "country_name" string   NOT NULL,
    CONSTRAINT "pk_Countries" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "Disciplines" (
    "discipline_id" int   NOT NULL,
    "discipline_name" string   NOT NULL,
    CONSTRAINT "pk_Disciplines" PRIMARY KEY (
        "discipline_id"
     )
);

CREATE TABLE "Events" (
    "event_id" int   NOT NULL,
    "event_name" string   NOT NULL,
    CONSTRAINT "pk_Events" PRIMARY KEY (
        "event_id"
     )
);

ALTER TABLE "Coaches" ADD CONSTRAINT "fk_Coaches_country_id" FOREIGN KEY("country_id")
REFERENCES "Countries" ("country_id");

ALTER TABLE "Coaches" ADD CONSTRAINT "fk_Coaches_discipline_id" FOREIGN KEY("discipline_id")
REFERENCES "Disciplines" ("discipline_id");

ALTER TABLE "Coaches" ADD CONSTRAINT "fk_Coaches_event_id" FOREIGN KEY("event_id")
REFERENCES "Events" ("event_id");

ALTER TABLE "Athletes" ADD CONSTRAINT "fk_Athletes_country_id" FOREIGN KEY("country_id")
REFERENCES "Countries" ("country_id");

ALTER TABLE "Athletes" ADD CONSTRAINT "fk_Athletes_discipline_id" FOREIGN KEY("discipline_id")
REFERENCES "Disciplines" ("discipline_id");

ALTER TABLE "Teams" ADD CONSTRAINT "fk_Teams_country_id" FOREIGN KEY("country_id")
REFERENCES "Countries" ("country_id");

ALTER TABLE "Teams" ADD CONSTRAINT "fk_Teams_discipline_id" FOREIGN KEY("discipline_id")
REFERENCES "Disciplines" ("discipline_id");

ALTER TABLE "Teams" ADD CONSTRAINT "fk_Teams_event_id" FOREIGN KEY("event_id")
REFERENCES "Events" ("event_id");

ALTER TABLE "Medals" ADD CONSTRAINT "fk_Medals_country_id" FOREIGN KEY("country_id")
REFERENCES "Countries" ("country_id");

