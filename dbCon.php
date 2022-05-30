<?php
$con = new mysqli("localhost","root","","restaurant");

if ($con){
    //echo "Connection succesfull";
}else{
    die(mysqli_error($con));
}