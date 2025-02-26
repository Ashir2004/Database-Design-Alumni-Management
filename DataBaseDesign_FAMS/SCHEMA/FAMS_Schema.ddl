CREATE TABLE alumni (
    alumni_profileid           VARCHAR2(15 CHAR) NOT NULL,
    alumni_organization        VARCHAR2(35 CHAR),
    alumni_currentposition     VARCHAR2(35 CHAR),
    alumni_linkedinprofile     VARCHAR2(50 CHAR),
    alumni_industry            VARCHAR2(25 CHAR),
    alumni_professionalsummary VARCHAR2(50 CHAR),
    alumni_privacysettings     VARCHAR2(50 CHAR),
    alumni_userid              VARCHAR2(15 CHAR) NOT NULL
);

CREATE UNIQUE INDEX alumni__idx ON
    alumni (
        alumni_userid
    ASC );

CREATE UNIQUE INDEX alumni__idxv1 ON
    alumni (
        alumni_userid
    ASC );

ALTER TABLE alumni ADD CONSTRAINT alumni_pk PRIMARY KEY ( alumni_profileid );

CREATE TABLE collaboration (
    collaboration_id        VARCHAR2(15 CHAR) NOT NULL,
    collaboration_role      VARCHAR2(20) NOT NULL,
    collaboration_joindate  DATE,
    collaboration_status    VARCHAR2(20) NOT NULL,
    collaboration_projectid VARCHAR2(15 CHAR) NOT NULL,
    collaboration_userid    VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE collaboration ADD CONSTRAINT collaboration_pk PRIMARY KEY ( collaboration_id );

CREATE TABLE donation (
    donation_id             VARCHAR2(15 CHAR) NOT NULL,
    donation_title          VARCHAR2(25 CHAR) NOT NULL,
    donation_description    VARCHAR2(50 CHAR),
    donation_targetedamount FLOAT NOT NULL,
    donation_amountraised   FLOAT NOT NULL,
    donation_date           DATE NOT NULL,
    donation_deadline       DATE NOT NULL,
    donation_status         VARCHAR2(15 CHAR) NOT NULL,
    donation_category       VARCHAR2(25 CHAR) NOT NULL,
    donation_userid         VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE donation ADD CONSTRAINT donation_pk PRIMARY KEY ( donation_id );

CREATE TABLE event (
    event_id                   VARCHAR2(15 CHAR) NOT NULL,
    event_name                 VARCHAR2(25 CHAR) NOT NULL,
    event_description          VARCHAR2(50 CHAR),
    event_date                 DATE,
    event_time                 TIMESTAMP WITH TIME ZONE,
    event_location             VARCHAR2(50 CHAR),
    event_maxparticipants      INTEGER,
    event_registrationdeadline DATE,
    event_banner               BLOB,
    event_participantcount     INTEGER,
    event_createddate          DATE NOT NULL,
    event_type                 VARCHAR2(30 CHAR) NOT NULL,
    event_organizerid          VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE event ADD CONSTRAINT event_pk PRIMARY KEY ( event_id );

CREATE TABLE feedback (
    feedback_id         VARCHAR2(15 CHAR) NOT NULL,
    feedback_givenby    VARCHAR2(15 CHAR) NOT NULL,
    feedback_receivedby VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE feedback ADD CONSTRAINT feedback_pk PRIMARY KEY ( feedback_id );

CREATE TABLE feedbackdetails (
    feedbackdetails_id         VARCHAR2(15 CHAR) NOT NULL,
    feedbackdetails_text       VARCHAR2(50 CHAR) NOT NULL,
    feedbackdetails_rating     VARCHAR2(15 CHAR),
    feedbackdetailsk_date      DATE NOT NULL,
    feedbackdetails_feedbackid VARCHAR2(15 CHAR) NOT NULL
);

CREATE UNIQUE INDEX feedbackdetails__idx ON
    feedbackdetails (
        feedbackdetails_feedbackid
    ASC );

ALTER TABLE feedbackdetails ADD CONSTRAINT feedbackdetails_pk PRIMARY KEY ( feedbackdetails_id );

CREATE TABLE forum (
    forum_id          VARCHAR2(15 CHAR) NOT NULL,
    forum_name        VARCHAR2(25 CHAR) NOT NULL,
    forum_description VARCHAR2(50 CHAR),
    forum_datecreated DATE NOT NULL,
    forum_createdby   VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE forum ADD CONSTRAINT forum_pk PRIMARY KEY ( forum_id );

CREATE TABLE help (
    help_id          VARCHAR2(15 CHAR) NOT NULL,
    help_title       VARCHAR2(25 CHAR) NOT NULL,
    help_content     VARCHAR2(50 CHAR) NOT NULL,
    help_section     VARCHAR2(30 CHAR),
    help_lastupdated DATE NOT NULL,
    help_visibility  VARCHAR2(20 CHAR),
    help_author      VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE help ADD CONSTRAINT help_pk PRIMARY KEY ( help_id );

CREATE TABLE job (
    job_id              VARCHAR2(15 CHAR) NOT NULL,
    job_type            VARCHAR2(25 CHAR) NOT NULL,
    job_salaryrange     VARCHAR2(30 CHAR),
    job_experiencelevel VARCHAR2(30 CHAR),
    job_title           VARCHAR2(25 CHAR) NOT NULL,
    job_description     VARCHAR2(50 CHAR) NOT NULL,
    job_companyname     VARCHAR2(25 CHAR),
    job_location        VARCHAR2(35 CHAR),
    job_applicationlink VARCHAR2(50 CHAR),
    job_dateposted      DATE NOT NULL,
    job_deadline        DATE,
    job_tags            VARCHAR2(100 CHAR),
    job_postedby        VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE job ADD CONSTRAINT job_pk PRIMARY KEY ( job_id );

CREATE TABLE mentorship (
    mentorship_id         VARCHAR2(15 CHAR) NOT NULL,
    mentorship_startdate  DATE NOT NULL,
    mentorship_enddate    DATE,
    mentorship_status     VARCHAR2(30 CHAR) NOT NULL,
    mentorship_objectives VARCHAR2(50 CHAR) NOT NULL,
    mentorship_notes      VARCHAR2(50 CHAR),
    mentor_id             VARCHAR2(15 CHAR) NOT NULL,
    mentee_id             VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE mentorship ADD CONSTRAINT mentorship_pk PRIMARY KEY ( mentorship_id );

CREATE TABLE news (
    news_id             VARCHAR2(15 CHAR) NOT NULL,
    news_title          VARCHAR2(25 CHAR) NOT NULL,
    news_content        VARCHAR2(50 CHAR) NOT NULL,
    news_posteddate     DATE NOT NULL,
    news_thumbnailimage BLOB,
    news_tags           VARCHAR2(100 CHAR),
    news_authorid       VARCHAR2(15 CHAR) NOT NULL
);

CREATE TABLE post (
    post_id            VARCHAR2(15 CHAR) NOT NULL,
    post_content       VARCHAR2(50 CHAR) NOT NULL,
    post_attachmenturl VARCHAR2(35 CHAR) NOT NULL,
    post_date          DATE NOT NULL,
    post_status        VARCHAR2(15 CHAR) NOT NULL,
    post_bannerimage   BLOB,
    post_forumid       VARCHAR2(15 CHAR) NOT NULL,
    post_postedby      VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE post ADD CONSTRAINT post_pk PRIMARY KEY ( post_id );

CREATE TABLE project (
    project_id          VARCHAR2(15 CHAR) NOT NULL,
    project_name        VARCHAR2(25 CHAR) NOT NULL,
    project_description VARCHAR2(50 CHAR) NOT NULL,
    project_startdate   DATE NOT NULL,
    project_enddate     DATE,
    project_status      VARCHAR2(15) NOT NULL,
    project_createdby   VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE project ADD CONSTRAINT project_pk PRIMARY KEY ( project_id );

CREATE TABLE registration (
    registration_id      VARCHAR2(15 CHAR) NOT NULL,
    registration_status  VARCHAR2(15 CHAR) NOT NULL,
    registration_date    DATE NOT NULL,
    registration_eventid VARCHAR2(15 CHAR) NOT NULL,
    registration_userid  VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE registration ADD CONSTRAINT registration_pk PRIMARY KEY ( registration_id );

CREATE TABLE report (
    report_id             VARCHAR2(15 CHAR) NOT NULL,
    report_graduationyear VARCHAR2(20 CHAR),
    report_industry       VARCHAR2(25 CHAR),
    report_salaryrange    VARCHAR2(30 CHAR) NOT NULL,
    report_date           DATE NOT NULL,
    report_image          BLOB,
    report_userid         VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE report ADD CONSTRAINT report_pk PRIMARY KEY ( report_id );

CREATE TABLE review (
    review_id     VARCHAR2(15 CHAR) NOT NULL,
    review_text   VARCHAR2(50 CHAR) NOT NULL,
    review_rating VARCHAR2(15 CHAR),
    review_date   DATE NOT NULL,
    reviewer_id   VARCHAR2(15 CHAR) NOT NULL,
    reviewee_id   VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE review ADD CONSTRAINT review_pk PRIMARY KEY ( review_id );

CREATE TABLE student (
    student_id              VARCHAR2(15 CHAR) NOT NULL,
    student_currentyear     VARCHAR2(10 CHAR) NOT NULL,
    student_currentsemester VARCHAR2(15 CHAR) NOT NULL,
    student_gpa             FLOAT,
    student_userid          VARCHAR2(15 CHAR) NOT NULL
);

CREATE UNIQUE INDEX student__idx ON
    student (
        student_userid
    ASC );

CREATE UNIQUE INDEX student__idxv1 ON
    student (
        student_userid
    ASC );

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( student_id );

CREATE TABLE "User" (
    user_id             VARCHAR2(15 CHAR) NOT NULL,
    user_cnic           VARCHAR2(20 CHAR) NOT NULL,
    user_fullname       VARCHAR2(25 CHAR) NOT NULL,
    user_nuid           VARCHAR2(8 CHAR) NOT NULL,
    user_dob            DATE NOT NULL,
    user_emailid        VARCHAR2(25 CHAR) NOT NULL,
    user_mobileno       VARCHAR2(15) NOT NULL,
    user_hashedpassword VARCHAR2(25 CHAR) NOT NULL,
    user_campus         VARCHAR2(20 CHAR) NOT NULL,
    user_profilepicture BLOB,
    user_role           VARCHAR2(10 CHAR) NOT NULL,
    user_isactive       BLOB NOT NULL,
    user_datecreated    DATE NOT NULL,
    user_lastupdated    DATE,
    user_department     VARCHAR2(30 CHAR) NOT NULL,
    user_currentcountry VARCHAR2(30 CHAR),
    user_currentcity    VARCHAR2(30 CHAR)
);

ALTER TABLE "User" ADD CONSTRAINT user_pk PRIMARY KEY ( user_id );

ALTER TABLE alumni
    ADD CONSTRAINT alumni_user_fk FOREIGN KEY ( alumni_userid )
        REFERENCES "User" ( user_id );

ALTER TABLE collaboration
    ADD CONSTRAINT collaboration_project_fk FOREIGN KEY ( collaboration_projectid )
        REFERENCES project ( project_id );

ALTER TABLE collaboration
    ADD CONSTRAINT collaboration_user_fk FOREIGN KEY ( collaboration_userid )
        REFERENCES "User" ( user_id );

ALTER TABLE donation
    ADD CONSTRAINT donation_user_fk FOREIGN KEY ( donation_userid )
        REFERENCES "User" ( user_id );

ALTER TABLE event
    ADD CONSTRAINT event_user_fk FOREIGN KEY ( event_organizerid )
        REFERENCES "User" ( user_id );

ALTER TABLE feedback
    ADD CONSTRAINT feedback_user_fk FOREIGN KEY ( feedback_givenby )
        REFERENCES "User" ( user_id );

ALTER TABLE feedback
    ADD CONSTRAINT feedback_user_fkv1 FOREIGN KEY ( feedback_receivedby )
        REFERENCES "User" ( user_id );

ALTER TABLE feedbackdetails
    ADD CONSTRAINT feedbackdetails_feedback_fk FOREIGN KEY ( feedbackdetails_feedbackid )
        REFERENCES feedback ( feedback_id );

ALTER TABLE forum
    ADD CONSTRAINT forum_user_fk FOREIGN KEY ( forum_createdby )
        REFERENCES "User" ( user_id );

ALTER TABLE help
    ADD CONSTRAINT help_user_fk FOREIGN KEY ( help_author )
        REFERENCES "User" ( user_id );

ALTER TABLE job
    ADD CONSTRAINT job_user_fk FOREIGN KEY ( job_postedby )
        REFERENCES "User" ( user_id );

ALTER TABLE mentorship
    ADD CONSTRAINT mentorship_user_fk FOREIGN KEY ( mentor_id )
        REFERENCES "User" ( user_id );

ALTER TABLE mentorship
    ADD CONSTRAINT mentorship_user_fkv2 FOREIGN KEY ( mentee_id )
        REFERENCES "User" ( user_id );

ALTER TABLE news
    ADD CONSTRAINT news_user_fk FOREIGN KEY ( news_authorid )
        REFERENCES "User" ( user_id );

ALTER TABLE post
    ADD CONSTRAINT post_forum_fk FOREIGN KEY ( post_forumid )
        REFERENCES forum ( forum_id );

ALTER TABLE post
    ADD CONSTRAINT post_user_fk FOREIGN KEY ( post_postedby )
        REFERENCES "User" ( user_id );

ALTER TABLE project
    ADD CONSTRAINT project_user_fk FOREIGN KEY ( project_createdby )
        REFERENCES "User" ( user_id );

ALTER TABLE registration
    ADD CONSTRAINT registration_event_fk FOREIGN KEY ( registration_eventid )
        REFERENCES event ( event_id );

ALTER TABLE registration
    ADD CONSTRAINT registration_user_fk FOREIGN KEY ( registration_userid )
        REFERENCES "User" ( user_id );

ALTER TABLE report
    ADD CONSTRAINT report_user_fk FOREIGN KEY ( report_userid )
        REFERENCES "User" ( user_id );

ALTER TABLE review
    ADD CONSTRAINT review_user_fk FOREIGN KEY ( reviewer_id )
        REFERENCES "User" ( user_id );

ALTER TABLE review
    ADD CONSTRAINT review_user_fkv2 FOREIGN KEY ( reviewee_id )
        REFERENCES "User" ( user_id );

ALTER TABLE student
    ADD CONSTRAINT student_user_fk FOREIGN KEY ( student_userid )
        REFERENCES "User" ( user_id );




