CREATE SCHEMA seleccion;

DROP TABLE IF EXISTS argentina;
CREATE TABLE argentina (
  Player varchar(22) NOT NULL,
  Age INT NOT NULL,
  Goals double precision	NOT NULL,
  Shot2Goal double precision	NOT NULL,
  PassesCompleted double precision	NOT NULL,
  AsistenciasxEjecucion double precision	NOT NULL,
  ShotCreationActions double precision	NOT NULL,
  DribblesSuccess double precision	NOT NULL,
  PlayersDribbled double precision	NOT NULL,
  GoalCreatingActions double precision	NOT NULL,
  DribblesLeadGoal double precision	NOT NULL,
  AerWon double precision	NOT NULL,
  PasPress double precision	NOT NULL,
  ShotsFreeKick double precision	NOT NULL,
  GoalsXShot double precision	NOT NULL,
  PassesthroughDefenders double precision	NOT NULL,
  ShoDist double precision	NOT NULL,
  DistPasesLargos double precision	NOT NULL,
  NumOrden INT NOT NULL,
  PRIMARY KEY(NumOrden)
);
