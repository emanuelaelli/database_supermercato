<html>
	<head>
		<title>Select reparto view personale</title>
		<link rel="stylesheet" type="text/css" href="stile.css">
	</head>
<body>
<script>
function myfunction() {
  document.getElementById("vdata").click();
};
</script>
	<p class="form">
<?php
	
	if(!isset($_POST['vdata'])){
   		$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
        if (!$conn){
            echo 'Connessione al database fallita.';
            exit();
            //die('Connessione al database fallita.');
        } else {
			//echo "Connessione riuscita."."<br/>";
			$query2="SELECT nome, viasupermercato FROM Reparto";
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
				print("<input id=\"vdata\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
				print("</form>"); 
				print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");   
			};
        };
	};

    if(isset($_POST['vdata']) and !empty($_POST['vdata']) and !empty($_POST['reparto'])) {
		//print(var_dump($_POST));
    	$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");		
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query2="SELECT nome, viasupermercato FROM Reparto";
			$result2 =  pg_query($conn, $query2);
			if (!$result2) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<select name=\"reparto\" onchange=\"myfunction();\">");
				while ($row = pg_fetch_array($result2)) {
					if($row["nome"]." ".$row["viasupermercato"] == $_POST['reparto']){
						print("<option value=\"".htmlspecialchars($row["nome"]." ".$row["viasupermercato"])."\" selected=\"selected\">");
					}else{
						print("<option value=\"".htmlspecialchars($row["nome"]." ".$row["viasupermercato"])."\">");
					};	
					echo $row["nome"]." ". $row["viasupermercato"];
					print("</option>");					
				};
				print("<input id=\"vdata\" style=\"display:none\" type=\"submit\" name=\"vdata\" value=\"View Data\">");
				print("</form>");    
				
				$selected=$_POST['reparto'];
				$query="SELECT cf, nome, cognome, datainizio, viasupermercato, numcivsupermercato
						FROM Lavora JOIN Impiegato ON cfimpiegato = cf
						WHERE datafine isnull AND CONCAT(nomereparto,' ',viasupermercato)='".$selected."';";
				
				$query3="SELECT cf, nome, cognome, datainizio, viasupermercato, numcivsupermercato
						FROM Supervisione JOIN Responsabile ON cfresponsabile = cf
						WHERE datafine isnull AND CONCAT(nomereparto,' ',viasupermercato)='".$selected."';";

				$result =  pg_query($conn, $query);
				$result3 =  pg_query($conn, $query3);

				if (!$result) {
					echo "Si è verificato un errore.<br/>";
					echo pg_last_error($conn);
					exit();
				} else if (!$result3) {
					echo "Si è verificato un errore.<br/>";
					echo pg_last_error($conn);
					exit();
				} else {
					echo '<br><table>
					<tr>
					<th>Nome</th>
					<th>Cognome</th>
					<th>Codice Fiscale</th>
					<th>Data di assunzione</th>
					<th>Via supermercato</th>
					<th>Numero civico supermercato</th>

					</tr>';
					while ($row = pg_fetch_array($result)) {
						echo '<tr>
						<td>'. $row['nome'].'</td> 
						<td>'. $row['cognome'].'</td> 
						<td>'. $row['cf'].'</td>  
						<td>'. $row['datainizio'].'</td> 
						<td>'. $row['viasupermercato'].'</td> 
						<td>'. $row['numcivsupermercato'].'</td>      		
						</tr>';//<td>'. $row['nint'].'</td>
					};
					while ($row = pg_fetch_array($result3)) {
						echo '<tr>
						<td>'. $row['nome'].'</td> 
						<td>'. $row['cognome'].'</td> 
						<td>'. $row['cf'].'</td>  
						<td>'. $row['datainizio'].'</td> 
						<td>'. $row['viasupermercato'].'</td> 
						<td>'. $row['numcivsupermercato'].'</td>      		
						</tr>';//<td>'. $row['nint'].'</td>
					};
					echo '</table>';
					print("</br><form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");

				};
			};
		};		

    };
   
?>
	</p>
</body>
</html>