<?php

class AdminConfig extends AbstractConfig {

    function __construct() {
        $this->setDbUser($_ENV["MYSQL_DB_ADMIN_USER"]);
        $this->setDbPwd($_ENV["MYSQL_DB_ADMIN_PASS"]);
        $this->setDbName($_ENV["MYSQL_DB_NAME"]);
    } // constructor
} // class
