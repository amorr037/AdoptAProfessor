<?php
/**
 * Created by PhpStorm.
 * User: cruiz
 * Date: 4/19/15
 * Time: 6:30 PM
 */

require_once('RequestResponse.php');
require_once('AuthenticationManager.php');
//get date range for professor of previous month
$month_ini = new DateTime("first day of last month");
$month_end = new DateTime("last day of last month");
$startDate = $month_ini->format('Y-m-d'); // 2012-(month-1)-01;
$endDate = $month_end->format('Y-m-d'); // 2012-(month-q)-29;
$startDate = $startDate . " 00:00:00";
$endDate = $endDate . " 24:00:00";
//echo $startDate;
//echo $endDate;

$am = new AuthenticationManager();
$res = $am->getProfessorOfPreviousMonth($startDate, $endDate);
if($res) die(json_encode (new GetProfileInfoResponse(true,$res['errMsg'],$res)));
die(json_encode (new RequestResponse(false,null)));