ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE  Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id)

ALTER TABLE Users
ADD CONSTRAINT  CK_Users_Username CHECK (len(Username) >=3)