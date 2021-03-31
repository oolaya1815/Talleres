<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Bottle web project template">
	<meta name="author" content="datamate">
	<link rel="icon" href="/static/favicon.ico">
	<title>Project</title>
	<link rel="stylesheet" type="text/css" href="/static/bootstrap.min.css">
	<script type="text/javascript" src="/static/jquery.min.js"></script>
	<script type="text/javascript" src="/static/bootstrap.min.js"></script>
</head>
<body>
	<!-- Static navbar -->
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="https://github.com/oolaya1815/Talleres/tree/main/Linux_Docker/Instalacion">Project</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="../">Home</a></li>
						<li><a href="../register">Registrarse</a></li>
						<li><a href="../acceder">Acceso</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="jumbotron">
			<h2>La versón de IA del backend es:</h2>
				<%
                import sys
                import time
                import tensorflow.keras
                import pandas as pd
                import sklearn as sk
                import tensorflow as tf
                tic = time.process_time()
                tf=tf.__version__
                kr=tensorflow.keras.__version__
                py=sys.version
                pa=pd.__version__
                sk=sk.__version__
                toc = time.process_time()
                tiempo = 1000*(toc-tic)
                %>
                <ul>
                <li>Tensorflow version: {{tf}}</li>
                <li>Keras version: {{kr}}</li>
                <li>Python version: {{py}}</li>
                <li>Pandas version: {{pa}}</li>
                <li>Scikit-Learn version: {{sk}}</li>
                </ul>
                <p>El tiempo de ejecución fue de: {{tiempo}} mili segundos<p>
			</div>
		</div>
		<!--./row-->
		<div class="row">
			<hr>
			<footer>
				<p>&copy; 2021 ADNBIT.</p>
			</footer>
		</div>
	</div>
	<!-- /container -->
</body>
</html>
