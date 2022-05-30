<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CRUD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  </head>
  <body>
    <div class="main">
      <h1>bestelling aanmaken</h1>
      <form action="create.php" method="POST">
        Tafelnummer<input name="tafel" type="text" class="form-control">
        Reserveringsnummer<input name="reserveringID" type="number" class="form-control">
        MenuItemID<input name="menuItemID" type="number" class="form-control">
        Aantal<input name="aantal" type="number" class="form-control">
        Prijs <input name="prijs" type="number" class="form-control">
        <br>
        <input type="submit">
      </form>
    </div>
  </body>
</html>