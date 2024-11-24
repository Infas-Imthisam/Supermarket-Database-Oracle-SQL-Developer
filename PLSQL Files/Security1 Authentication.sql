-- create the users with Password
CREATE USER C##_Infas IDENTIFIED BY 2003;
CREATE USER C##_Pasindu IDENTIFIED BY 2001;
CREATE USER C##_Navodh IDENTIFIED BY 2002;
CREATE USER C##_Chiran IDENTIFIED BY 2004;
CREATE USER C##_Executive_Manager IDENTIFIED BY 2000;
CREATE USER C##_NIBM IDENTIFIED BY 2023;


-- allow them to log in to the database:
GRANT CREATE SESSION TO C##_Infas;
GRANT CREATE SESSION TO C##_Pasindu;
GRANT CREATE SESSION TO C##_Navodh;
GRANT CREATE SESSION TO C##_Chiran;
GRANT CREATE SESSION TO C##_NIBM;


--------------------------------------------------------------------------------

-- Authentication
CREATE PROFILE C##_secure_users LIMIT 
PASSWORD_LIFE_TIME 90         -- Password expires after 90 days
FAILED_LOGIN_ATTEMPTS 5;      -- Maximum 5 failed login attempts


-- Assign the secure profile to each user
ALTER USER C##_Infas PROFILE C##_secure_users;
ALTER USER C##_Pasindu PROFILE C##_secure_users;
ALTER USER C##_Navodh PROFILE C##_secure_users;
ALTER USER C##_Chiran PROFILE C##_secure_users;
ALTER USER C##_NIBM PROFILE C##_secure_users;


-- Verify the Profile 
SELECT username, profile 
FROM dba_users
WHERE profile = 'C##_SECURE_USERS';

--------------------------------------------------------------------------------

-- Check the status of the user
SELECT username, created, account_status 
FROM dba_users;

--------------------------------------------------------------------------------

-- Unlocking account
ALTER USER user1 ACCOUNT UNLOCK;
--------------------------------------------------------------------------------

-- View All Users
SELECT username FROM all_users;

--------------------------------------------------------------------------------

CONNECT C##_INFAS/2003