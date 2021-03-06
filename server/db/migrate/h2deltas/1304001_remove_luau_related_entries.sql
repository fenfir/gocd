--*************************GO-LICENSE-START*********************************
-- Copyright 2014 ThoughtWorks, Inc.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--*************************GO-LICENSE-END***********************************

DROP TABLE IF EXISTS luau_groups_users;
DROP TABLE IF EXISTS luau_groups;
DROP TABLE IF EXISTS luaustate;

--//@UNDO

CREATE TABLE luau_groups (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 1) PRIMARY KEY,
    name VARCHAR,
    fullName VARCHAR,
    uri VARCHAR
);

CREATE TABLE luau_groups_users (
    luau_group_id BIGINT,
    user_id BIGINT
);

ALTER TABLE luau_groups_users ADD CONSTRAINT fk_luau_group_id FOREIGN KEY(luau_group_id) REFERENCES luau_groups(id);
ALTER TABLE luau_groups_users ADD CONSTRAINT fk_user_id FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE luau_groups ADD CONSTRAINT unique_uri UNIQUE (uri);



CREATE TABLE luauState (
id BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 1) PRIMARY KEY,
clientKey  VARCHAR(255),
authStateExplanation  VARCHAR(255),
lastClientDigest VARCHAR(255),
lastSyncStatus VARCHAR(255),
submittedAt  TIMESTAMP,
lastSyncAt  TIMESTAMP,
lastSuccessfulSyncAt  TIMESTAMP,
markForDeletion BOOLEAN DEFAULT FALSE
);



