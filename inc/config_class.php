<?php
class Config extends AbstractConfig {
    function __construct() {
        $this->setDbUser($_ENV["MYSQL_DB_VIEW_USER"]);
        $this->setDbPwd($_ENV["MYSQL_DB_VIEW_PASS"]);
        $this->setDbName($_ENV["MYSQL_DB_NAME"]);
        
        // Set your preferred language en_US, de_DE, or pt_BR
        $this->setLocale('en_US');
        
        /* local storage */
        
        $this->setUrlBootstrap('/contrib/bootstrap/');
        $this->setUrlJquery('/contrib/jquery/');
        $this->setUrlJqueryui('/contrib/jqueryui/');
        $this->setUrlJAtimepicker('/contrib/timepicker/');
        $this->setUrlChartjs('/contrib/chartjs/');
        $this->setUrlJQCloud('/contrib/jqcloud/');
    } // constructor
} // class
