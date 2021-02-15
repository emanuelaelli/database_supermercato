<html>
	<head>
		<title>View data</title>
		<link rel="stylesheet" type="text/css" href="stile.css">
	</head>
<body>
		<p class="form">
<?php
    if(isset($_POST['vdata']) and  !empty($_POST['vdata']))
    {
    	$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query="SELECT * FROM PremiSpeciali JOIN Prenotazione ON PremiSpeciali.id = Prenotazione.id WHERE modalitàacquisto = 'puntiEdenaro' AND denaromodalitàpagamento < 201";
			$result =  pg_query($conn, $query);
			if (!$result) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				echo '<br><table>
				<tr>
                
                    <th>ID</th>
                    <th>codicePremio</th>
                    <th>disponibilità</th>
                    <th>puntiModalitàPagamento</th>
                    <th>denaroModalitàPagamento</th>
				</tr>';
				while ($row = pg_fetch_array($result)) {
					echo '<tr>
						<td>'. $row['id'].'</td>
						<td>'. $row['codicepremio'].'</td>
						<td>'. $row['disponibilità'].'</td>
						<td>'. $row['puntimodalitàpagamento'].'</td>          
						<td>'. $row['denaromodalitàpagamento'].'</td>       		
					</tr>';//<td>'. $row['nint'].'</td>
				};
				echo '</table>';
		
			};

		}
    }
    else
    {
		print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
	    print("<input type=\"submit\" name=\"vdata\" value=\"View Data\">");
	    print("</form>");    
    }
   
?>
	</p>
</body>
</html>