<html>
	<head>
		<title>View prodotti assemblati</title>
		<link rel="stylesheet" type="text/css" href="stile.css">
	</head>
<body>
<script>
    function myfunction() {
        document.getElementById("udata").click();
    };
</script>
<p class="form">
<?php
	if(!isset($_POST['udata'])){
        $conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
        if (!$conn){
            echo 'Connessione al database fallita.';
            exit();
            //die('Connessione al database fallita.');
        } else {
            //echo "Connessione riuscita."."<br/>";
            $query2="SELECT nome, via FROM Supermercato ORDER BY nome";
            $result2 =  pg_query($conn, $query2);
            
            if (!$result2) {
                echo "Si è verificato un errore.<br/>";
                echo pg_last_error($conn);
                exit();
            } else {
                print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
                print("<select name=\"supermercato\" onchange=\"myfunction();\">");
                while ($row = pg_fetch_array($result2)) {
                    print("<option value=\"".htmlspecialchars($row["via"])."\">");
                    echo $row["nome"];
                    print("</option>");					
                };
                print("<input id=\"udata\" type=\"submit\" name=\"udata\" value=\"Vedi prodotti assemblati\">");
                print("</form>");
                print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");    

            };
         };
    };

    if(isset($_POST['udata']) and $_POST['udata']=='Vedi prodotti assemblati') {
    	$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
            //echo "Connessione riuscita."."<br/>";
            $selected=$_POST['supermercato'];
            $query="SELECT composto, componente, quantità
            FROM Composizione JOIN Vende ON composto = codiceinternoprodotto 
            WHERE viasupermercato = '".$selected."' AND composto IN (SELECT composto
                                                                        FROM composizione 
                                                                        GROUP BY composto
                                                                        HAVING COUNT(componente) >= 1)";

            $result =  pg_query($conn, $query);
            
            echo '<table>
                    <tr>
                        <th>Composto</th>
                        <th>Componente</th>
                        <th>Quantità</td>
                    </tr>';

            while($array=pg_fetch_assoc($result)) {
                echo '<tr>
                        <td>'. $array['composto'].'</td>
                        <td>'. $array['componente'].'</td>
                        <td>'. $array['quantità'].'</td>       		
                    </tr>';
		    }
            echo '</table>';
            print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
            echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
            echo "</form>";
		}
    }

?>

	</p>
</body>
</html>




