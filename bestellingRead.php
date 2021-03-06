<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>overzicht drankjes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  </head>
  <body>
    <div class="container">
        <div class="row">
            <div class="col-3">
                <ul class="list-group">
                    <li class="list-group-item"><a href="index.html">Hoofdscherm</a></li>
                    <li class="list-group-item"><a href="#">Nog invullen</a></li>
                  </ul>
            </div>
            <div class="col-6">
            <table class="table">
          <thead>
            <tr>
              <th scope="col">Drankje</th>
              <th scope="col">Aantal</th>
            </tr>
          </thead>
          <tbody>
          <?php
            include 'dbCon.php';
            $sql="SELECT bestelling.aantal, menuItem,menuItem
                  FROM bestelling
                  INNER JOIN menuItem
                  ON bestelling.menuItemID = menuItem.MenuItemID";
            $result = mysqli_query($con,$sql);
            if($result){
              while($row=mysqli_fetch_assoc($result)){
                  $menuItem=$row['menuItem'];
                  $aantal=$row['aantal'];
            echo'<tr>
                <th scope="row">'.$menuItem.'</th>
                <td>'.$aantal.'</td>
                </tr>';
              }
            }
          ?>
          </tbody>
        </table>
            </div>
        </div>
    </div>
   </body>
</html>