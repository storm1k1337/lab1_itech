<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа №1</title>
</head>
<body>
    <div class="main-block">
      <form action="select-1.php" method="post">
      <h4>Выберите процессор</h4>
         <select name="processor">
            <?php
            $connection = mysqli_connect('localhost', 'root', '', 'comp');

            $query = 'SELECT * FROM `processor`';

            $result = mysqli_query($connection, $query);

            $res=mysqli_fetch_all ($result, MYSQLI_NUM);
            foreach($res as $name)
            echo "<option value='".$name[1]."'>".$name[1]."</option>";
            ?>
         </select>
         <input type="submit" name="form1" value="Поиск"><br>
         </form>
      <form action="select-2.php" method="post">
      <h4>Выберите ПО</h4>
         <select name="software">
               <?php
               $conn = new mysqli('localhost', 'root', '', 'comp');

               $query = 'SELECT * FROM `software`';

               $result = mysqli_query($conn, $query);

               $res=mysqli_fetch_all ($result, MYSQLI_NUM);
               foreach($res as $name)
               print "<option value='".$name[1]."'>".$name[1]."</option>";
               ?>
         </select>
         <input type="submit" name="form2" value="Поиск"><br>
      </form>
      <form action="select-3.php" method="post">
         <h4>Компьютер с истекшим гарантийным сроком. <br> Например 2023-07-07</h4>
         <input type="text" name="udate" />
         <input type="submit" name="form3" value="Поиск"><br>
      </form>
   </div>
</body>
</html>