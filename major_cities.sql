USE test;
--
-- Table structure for table `us_states`
--
DROP TABLE IF EXISTS US_STATES;
CREATE TABLE US_STATES (
	STATE_CODE char(2) NOT NULL,
	STATE_NAME varchar(50) NOT NULL,
	PRIMARY KEY (STATE_CODE)
);

