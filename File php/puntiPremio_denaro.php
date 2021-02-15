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
			$query2="SELECT * FROM PremiSpeciali";
			$result2 =  pg_query($conn, $query2);
			if (!$result2) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<select name=\"premispeciali\" onchange=\"myfunction();\">"); 
				while ($row = pg_fetch_array($result2)) {
					print("<option value=\"".htmlspecialchars($row["denaromodalitàpagamento"])."\">");
                    echo $row["denaromodalitàpagamento"];
					print("</option>");					
				};
				print("<input id=\"vdata\" type=\"submit\" name=\"vdata\" value=\"View premi\">");
				print("</form>"); 
				print("<form action=\"home.php\"> <button type=\"submit\"> Torna alla home </button> </form>");   
			};
        };
	};

    if(isset($_POST['vdata']) and !empty($_POST['vdata']) and !empty($_POST['premispeciali'])) {
		//print(var_dump($_POST));
    	$conn = pg_connect("host=localhost port=5432 dbname=progettosupermercato user=postgres password=BDDWLab20");		
		if (!$conn){
			echo 'Connessione al database fallita.';
			exit();
			//die('Connessione al database fallita.');
		} else {
			//echo "Connessione riuscita."."<br/>";
			$query2="SELECT * FROM PremiSpeciali";
			$result2 =  pg_query($conn, $query2);
			if (!$result2) {
				echo "Si è verificato un errore.<br/>";
				echo pg_last_error($conn);
				exit();
			} else {
				print("<form action=\"".htmlspecialchars($_SERVER['PHP_SELF'])."\" method=\"POST\">");
				print("<select name=\"premispeciali\" onchange=\"myfunction();\">");
				while ($row = pg_fetch_array($result2)) {
					if($row["denaromodalitàpagamento"] == $_POST['premispeciali']){
						print("<option value=\"".htmlspecialchars($row["denaromodalitàpagamento"])."\" selected=\"selected\">");
					}else{
						print("<option value=\"".htmlspecialchars($row["denaromodalitàpagamento"])."\">");
					};	
					echo $row["denaromodalitàpagamento"];
					print("</option>");					
				};
				print("<input id=\"vdata\" style=\"display:none\" type=\"submit\" name=\"vdata\" value=\"View premi\">");
				print("</form>");    
				
				$selected=$_POST['premispeciali'];
				$query="SELECT *
						FROM PremiSpeciali
						WHERE denaromodalitàpagamento <= '".$selected."';";
	
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
					
					while ($row = pg_fetch_array($result3)) {
						echo '<tr>
						<td>'. $row['id'].'</td> 
						<td>'. $row['codicepremio'].'</td> 
						<td>'. $row['disponibilità'].'</td>  
						<td>'. $row['puntimodalitàpagamento'].'</td> 
						<td>'. $row['denaromodalitàpagamento'].'</td>      		
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