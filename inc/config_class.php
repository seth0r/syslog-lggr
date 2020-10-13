<?php
class Config extends AbstractConfig {
    function __construct() {
        $this->setDbUser(getenv("MYSQL_DB_VIEW_USER"));
        $this->setDbPwd(getenv("MYSQL_DB_VIEW_PASS"));
        $this->setDbName(getenv("MYSQL_DB_NAME"));
        
        // Set your preferred language en_US, de_DE, or pt_BR
        $this->setLocale('en_US');
        
        /* remote storage */
        $this->setUrlBootstrap('//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/');
        $this->setUrlJquery('//code.jquery.com/');
        $this->setUrlJqueryui('//code.jquery.com/ui/1.11.4/');
        $this->setUrlJAtimepicker(
            '//cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.4.5/');
        $this->setUrlChartjs('//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/');
        $this->setUrlJQCloud('//cdnjs.cloudflare.com/ajax/libs/jqcloud/1.0.4/');
    } // constructor
} // class
