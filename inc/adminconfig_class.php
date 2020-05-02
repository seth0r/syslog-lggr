<?php

class AdminConfig extends AbstractConfig {

    function __construct() {
        $this->setDbUser(getenv("MYSQL_DB_ADMIN_USER"));
        $this->setDbPwd(getenv("MYSQL_DB_ADMIN_PASS"));
        $this->setDbName(getenv("MYSQL_DB_NAME"));
    } // constructor
} // class
