<html>
	<head>
		<title>View prodotti da riordinare</title>
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
            $query2="SELECT nome, viasupermercato FROM Reparto ORDER BY nome";
            $result2 =  pg_query($conn, $query2);
            
            if (!$result2) {
                echo "Si è verificato un errore.<br/>";
                echo pg_last_error($conn);
                exit();
            } else {
                print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
                print("<select name=\"reparto\" onchange=\"myfunction();\">");
                while ($row = pg_fetch_array($result2)) {
                    print("<option value=\"".htmlspecialchars($row["nome"]." ".$row["viasupermercato"])."\">");
                    echo $row["nome"]." ".$row["viasupermercato"];
                    print("</option>");					
                };
                print("<input id=\"udata\" type=\"submit\" name=\"udata\" value=\"Vedi prodotti da riordinare\">");
                print("</form>"); 
                print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");

            };
        };
    };

    if(isset($_POST['udata']) and $_POST['udata']=='Vedi prodotti da riordinare') {
    	$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
            //echo "Connessione riuscita."."<br/>";
            $selected=$_POST['reparto'];
            $query="SELECT r.codiceinternoprodotto AS codiceinternoprodotto, r.stimadiconsegna AS stimadiconsegna, s.quantità AS quantità, s.sogliaminima AS sogliaminima
            FROM (rifornisce AS r JOIN vende AS v ON r.codiceinternoprodotto = v.codiceinternoprodotto) JOIN stoccaggio AS s ON r.codiceinternoprodotto = s.codiceinternoprodotto
            WHERE CONCAT(v.nomereparto,' ',v.viasupermercato) = '".$selected."' AND s.sogliaminima > s.quantità;";
            $result =  pg_query($conn, $query);
            
            echo '<table>
                    <tr>
                        <th>Codice interno prodotto</th>
                        <th>Stima di consegna</th>
                        <th>Quantità</td>
                        <th>Soglia minima</th>
                    </tr>';

            while($array=pg_fetch_assoc($result)) {
                echo '<tr>
                        <td>'. $array['codiceinternoprodotto'].'</td>
                        <td>'. $array['stimadiconsegna'].'</td>
                        <td>'. $array['quantità'].'</td>  
                        <td>'. $array['sogliaminima'].'</td>      		
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




