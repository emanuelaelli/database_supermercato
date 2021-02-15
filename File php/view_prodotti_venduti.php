<html>
	<head>
		<title>View prodotti venduti</title>
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
                print("<input id=\"udata\" type=\"submit\" name=\"udata\" value=\"Vedi scontrini\">");
                print("</form>"); 
                print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");

            };
         };
    };

    if (isset($_POST['udata']) and $_POST['udata']=='Vedi scontrini') { //SCELTA SCONTRINO
        $conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
        if (!$conn){
            echo 'Connessione al database fallita.';
            exit();
            //die('Connessione al database fallita.');
        } else {
            $selected=$_POST['reparto'];
            $query3="SELECT s.data AS data, s.numeroscontrino AS numeroscontrino
            FROM (Scontrino as s JOIN PS as p ON s.numeroscontrino = p.numeroscontrino) JOIN Vende as v ON p.codiceinternoprodotto = v.codiceinternoprodotto
            WHERE CONCAT(v.nomereparto,' ',v.viasupermercato)='".$selected."';";
            $result3 =  pg_query($conn, $query3);
            if (!$result3) {
                echo "Si è verificato un errore.<br/>";
                echo pg_last_error($conn);
                exit();
            } else {
                print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">"); //style=\"display:none\"
                print("<select name=\"scontrino\" onchange=\"myfunction();\">");
                while ($row = pg_fetch_array($result3)) {
                    print("<option value=\"".htmlspecialchars($row["numeroscontrino"])."\">");
                    echo $row["data"];
                    print("</option>");					
                };
                print("<input id=\"udata\" type=\"submit\" name=\"udata\" value=\"View\">");
                print("</form>");
                print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");
 
            };
        }


    } else if(isset($_POST['udata']) and $_POST['udata']=='View') {
    	$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
            //echo "Connessione riuscita."."<br/>";
            $selected2=$_POST['scontrino'];
            if (!isset($selected2)) {
                echo "Si è verificato un errore.<br/>";
                echo pg_last_error($conn);
                exit();
            }
            $query="SELECT codiceinternoprodotto, quantità
            FROM PS
            WHERE numeroscontrino='".$selected2."';";
            $result =  pg_query($conn, $query);
            echo '<table>
                    <tr>
                        <th>Codice prodotto</th>
                        <th>Quantità</td>
                    </tr>';

            while($array=pg_fetch_assoc($result)) {
                echo '<tr>
                        <td>'. $array['codiceinternoprodotto'].'</td>
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




