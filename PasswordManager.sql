-- UserDetails table definition
create table UserDetails
(user_name varchar(50) PRIMARY KEY NOT NULL, 
 password varchar(20) NOT NULL,
 email varchar(50) NOT NULL,
 name varchar(50) NOT NULL,
 role varchar(50) NOT NULL DEFAULT 'ROLE_USER');
 
--PasswordDetails table definition
create table PasswordDetails
(category varchar(50) NOT NULL,
login_name varchar(20) NOT NULL,
password varchar(20) NOT NULL,
user_name varchar(50) NOT NULL,
CONSTRAINT pk_PasswordDetails PRIMARY KEY (category,login_name),
CONSTRAINT fk_PasswordDetails FOREIGN KEY (user_name) REFERENCES UserDetails(user_name));

--AuditPasswordDetails table definition
create table AuditPasswordDetails
(id SERIAL,
category varchar(50) NOT NULL,
login_name varchar(20) NOT NULL,
old_password varchar(20) NULL,
new_password varchar(20) NULL,
user_name varchar(50) NOT NULL,
action_name char(1) NOT NULL,
change_date timestamp NOT NULL,
CONSTRAINT pk_AuditPasswordDetails PRIMARY KEY (id)
);




--Trigger definition
CREATE OR REPLACE FUNCTION process_pwd_audit() RETURNS TRIGGER AS $pwd_audit$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO AuditPasswordDetails(category, login_name, old_password, new_password, user_name, action_name, change_date) 
			values (OLD.category, OLD.login_name, OLD.password, null, OLD.user_name, 'D', now());
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
	    INSERT INTO AuditPasswordDetails(category, login_name, old_password, new_password, user_name, action_name, change_date) 
			values (OLD.category, OLD.login_name, OLD.password, NEW.password, OLD.user_name, 'U', now());            
	    RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO AuditPasswordDetails(category, login_name, old_password, new_password, user_name, action_name, change_date) 
			values (NEW.category, NEW.login_name, null, NEW.password, NEW.user_name, 'I', now());    
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$pwd_audit$ language plpgsql;

CREATE TRIGGER pwd_audit
AFTER INSERT OR UPDATE OR DELETE ON PasswordDetails
    FOR EACH ROW EXECUTE PROCEDURE process_pwd_audit();
