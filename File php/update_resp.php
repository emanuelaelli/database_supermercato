<html>
	<head>
		<title>Update responsabili</title>
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
		//myfunction();
	
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
                print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">"); //style=\"display:none\"
                print("<select name=\"reparto\" onchange=\"myfunction();\">");
                while ($row = pg_fetch_array($result2)) {
                    print("<option value=\"".htmlspecialchars($row["nome"]." ".$row["viasupermercato"])."\">");
                    echo $row["nome"]." ".$row["viasupermercato"];
                    print("</option>");					
                };
                print("<input id=\"udata\" type=\"submit\" name=\"udata\" value=\"Vedi responsabile\">");
                print("</form>");
                print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");    
    
            };
        };
	
	};

    if(isset($_POST['udata']) and $_POST['udata']=='View') {
    	$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
		if (!$conn) {
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
            //echo "Connessione riuscita."."<br/>";
            $query="SELECT  cf, datadinascita, cap, via, numciv, città, nome, cognome, email, numturno, numlivello, nomereparto, viasupermercato, numcivsupermercato 
            FROM Responsabile JOIN Supervisione ON cf = cfresponsabile 
            WHERE datafine ISNULL";
            $result =  pg_query($conn, $query);
            echo '<table>
                    <tr>
                        <th>Codice fiscale</th>
                        <th>Data di nascita</td>
                        <th>CAP</th>
                        <th>Via</th>
                        <th>Numero civico</th>
                        <th>Città</th>
                        <th>Nome</th>
                        <th>Cognome</th>
                        <th>Email</th>
                        <th>Numero turno</th>
                        <th>Numero livello</th>
                        <th>Nome reparto</th>
                        <th>Via supermercato</th>
                        <th>Numero civico supermercato</th>
                    </tr>';

            while($array=pg_fetch_assoc($result)) {
                echo '<tr>
                        <td>'. $array['cf'].'</td>
                        <td>'. $array['datadinascita'].'</td>
                        <td>'. $array['cap'].'</td>
                        <td>'. $array['via'].'</td>          
                        <td>'. $array['numciv'].'</td>
                        <td>'. $array['città'].'</td> 
                        <td>'. $array['nome'].'</td>
                        <td>'. $array['cognome'].'</td>
                        <td>'. $array['email'].'</td>
                        <td>'. $array['numturno'].'</td>
                        <td>'. $array['numlivello'].'</td> 
                        <td>'. $array['nomereparto'].'</td>
                        <td>'. $array['viasupermercato'].'</td>
                        <td>'. $array['numcivsupermercato'].'</td>        		
                    </tr>';
		    }
		echo '</table>';
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
		echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
		echo "</form>";
		}
	} else if(isset($_POST['udata']) and $_POST['udata']=='Vedi responsabile') {
        $conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
            //echo "Connessione riuscita."."<br/>";
            $selected=$_POST['reparto'];
            $query="SELECT  cf, datadinascita, cap, via, numciv, città, nome, cognome, email, numturno, numlivello 
            FROM Responsabile JOIN Supervisione ON cf = cfresponsabile 
            WHERE datafine ISNULL AND CONCAT(nomereparto,' ',viasupermercato)='".$selected."';";
            //echo $query;
            $result =  pg_query($conn, $query);
            $array=pg_fetch_assoc($result);
            if (!$array) {
                echo "Si è verificato un errore.<br/>";
                echo pg_last_error($conn);
                exit();
            } else {
                
                print("<table>");
                print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
                print("<tr><th>Codice fiscale</th><td><input type=\"text\" name=\"cf\" value='".$array['cf']."' required pattern=\"[A-Z0-9]{16}\" title=\"Sono ammessi solo caratteri maiuscoli e numeri.\" readonly></td></tr>");
                print("<tr><th>Data di nascita</th><td><input type=\"text\" name=\"datadinascita\" value='".$array['datadinascita']."' required pattern=\"[0-9]{4}\-[0-9]{2}\-[0-9]{2}\" title=\"Sono ammesse date nel formato AA-MM-DD.\" ></td</tr>");
                print("<tr><th>CAP</th><td><input type=\"text\" name=\"cap\" value='".$array['cap']."' required pattern=\"[0-9]{5}\" title=\"Sono ammessi solo numeri.\"></td></tr>");
                print("<tr><th>Via</th><td><input type=\"text\" name=\"via\" value='".$array['via']."' required pattern=\"[a-zA-Z_-.]{1,20}\"title=\"Sono ammessi solo caratteri.\"></td></tr>");
                print("<tr><th>Numero civico</th><td><input type=\"text\" name=\"numciv\" value='".$array['numciv']."' required pattern=\"[0-9]{1,3}\" title=\"Sono ammessi solo numeri interi.\"></td></tr>");
                print("<tr><th>Città</th><td><input type=\"text\" name=\"città\" value='".$array['città']."'required ></td></tr>");
                print("<tr><th>Nome</th><td><input type=\"text\" name=\"nome\" value='".$array['nome']."' required ></td></tr>");
                print("<tr><th>Cognome</th><td><input type=\"text\" name=\"cognome\" value='".$array['cognome']."' required ></td></tr>");
                print("<tr><th>Email</th><td><input type=\"text\" name=\"email\" value='".$array['email']."' required pattern=\"[a-z0-9_]+@[a-z0-9\-]+\.[a-z0-9\-\.]+$]{1,254}\"title=\"Sono ammessi solo caratteri e numeri.\" ></td></tr>");
                print("<tr><th>Numero turno</th><td><input type=\"text\" name=\"numturno\" value='".$array['numturno']."' required pattern=\"[0-9]{1}\"title=\"Sono ammessi solo numeri.\" ></td></tr>");
                print("<tr><th>Numero livello</th><td><input type=\"text\" name=\"numlivello\" value='".$array['numlivello']."' required pattern=\"[0-9]{1}\"title=\"Sono ammessi solo numeri.\" ></td></tr>");
                print("<tr><td><input type=\"submit\" name=\"udata\" value=\"Send\"></td></tr>");
                print("</form>");
                print("</table>");
                print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
                echo "<input type=\"submit\" name=\"back\" value=\"Back\" class=\"button\">";
                echo "</form>";
           
            }    
		}
    } else if( isset($_POST['udata']) and $_POST['udata']=='Send') {   
        $conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
            $cf=isset($_POST['cf'])?$_POST['cf']:'';
            $datadinascita=isset($_POST['datadinascita'])?$_POST['datadinascita']:'';
            $cap=(isset($_POST['cap'])and is_numeric($_POST['cap']))?$_POST['cap']:0;
            $via=isset($_POST['via'])?$_POST['via']:'';
            $numciv=(isset($_POST['numciv'])and is_numeric($_POST['numciv']))?$_POST['numciv']:0;
            $città=isset($_POST['città'])?$_POST['città']:'';
            $nome=isset($_POST['nome'])?$_POST['nome']:'';
            $cognome=isset($_POST['cognome'])?$_POST['cognome']:'';
            $email=isset($_POST['email'])?$_POST['email']:'';
            $numturno=(isset($_POST['numturno'])and is_numeric($_POST['numturno']))?$_POST['numturno']:0;
            $numlivello=(isset($_POST['numlivello'])and is_numeric($_POST['numlivello']))?$_POST['numlivello']:0;

            $query="update Impiegato set datadinascita='$datadinascita', cap=$cap, via='$via', numciv=$numciv, città='$città', nome='$nome', 
            cognome='$cognome', email='$email', mansione='$mansione', numturno=$numturno, numlivello=$numlivello where cf='$cf'";
            $result = pg_query($conn,$query);
        
            if ($result){
                //header('location:index.php?insert=Ok insert');
                echo "Inserimento avvenuto con successo<br>";
            } else {
            // header('location:index.php?insert=Error insert record');
                echo "Si è verificato un errore.<br/>";
                echo pg_last_error($conn);
                //exit();
            }
                print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
                print("<input type=\"submit\" name=\"udata\" value=\"View\">");
                //print("<input type=\"submit\" name=\"udata\" value=\"Update\">");
                print("</form>");
                print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");    
    
            }
        } 
	    
?>

	</p>
</body>
</html>