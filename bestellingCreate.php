<?php
include 'dbCon.php';

if(isset($_POST['submit'])){
  $tafel          = $_POST['tafel'];
  $menuItemID     = $_POST['menuItemID'];
  $aantal         = $_POST['aantal'];
  $prijs          = $_POST['prijs'];

  $sql="insert into `bestelling` (tafel,reserveringID,menuItemID,aantal,prijs) values ('$tafel','$reserveringID','$menuItemID','$aantal','$prijs')";

  $result=mysqli_query($con,$sql);
  if($result){
    echo "Bestelling toegevoegd";
  } else{
    die(mysqli_error($con));
    echo"Bestelling niet toegevoegd";
  } 
}
header("Location: bestellingRead.php");
exit;
?>