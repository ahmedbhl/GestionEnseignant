<%@ include file="/WEB-INF/views/includes/includes.jsp"%>
<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Enseignants</title>

<!-- Bootstrap Core CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/resources/dist/css/sb-admin-2.css"
	rel="stylesheet">
<!-- DataTables CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath()%>/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">

			<%@ include file="/WEB-INF/views/menu_top/topMenu.jsp"%>
			<%@ include file="/WEB-INF/views/menu_left/leftMenu.jsp"%>
			<!-- /.navbar-static-side -->
		</nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Semestres</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				
				<c:if test="${not empty successMsg}">
				<div class="alert alert-success alert-dismissable">
                <button class="close" aria-hidden="true" type="button" data-dismiss="alert">�</button>
                 ${successMsg}.
                </div>
                </c:if>
                            				
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<c:url value="/semestres/nouveau" var="semestres"></c:url>
  							<li><a href="${semestres}"><i class="fa fa-plus">&nbsp;Ajouter</i></a></li>
  							<li><a href="#"><i class="fa fa-upload ">&nbsp;Importer</i></a></li>
  							<li><a href="#"><i class="fa fa-download ">&nbsp;Exporter</i></a></li>
						</ol>
					</div>
				</div>
				   
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Liste des Semestres</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<table width="100%"	style="text-align:center" class="table table-striped table-bordered table-hover"	id="dataTables-example">
									<thead>
										<tr>
											<th style="text-align:center">Description</th>
											<th style="text-align:center">Date Debut</th>
											<th style="text-align:center">Date Fin</th>
											<th style="text-align:center">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listesemestres}" var="listesemestres">

											<tr class="odd gradeX">
												<td>${listesemestres.getDescription() }</td>
												<td>${listesemestres.getDate_deb()}</td>
												<td>${listesemestres.getDate_fin()}</td>
												
												<td><c:url
														value="/semestres/modifier/${listesemestres.getIdSemestre()}"
														var="updateSemestre"></c:url> <a
													href="${updateSemestre}"><i class="fa fa-edit"></i></a> 
													 &nbsp;|&nbsp;<a href="javascript:void(0);" data-toggle="modal" data-target="#modal${listesemestres.getIdSemestre()}"><i class="fa fa-trash-o"></i></a>
													<div style="text-align:left" class="modal fade" id="modal${listesemestres.getIdSemestre()}"  role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">&times;</button>
																<h4 class="modal-title" id="myModalLabel">Confirmation </h4>
															</div>
															<div class="modal-body">�tes-vous s�r de vouloir
																supprimer ce semestre !<br><i class="text-danger"><b>Nb:</b> Toutes les charges d'enseignements li�es � ce semestre seront supprim�es</i></div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Annuler</button>
																<c:url	value="/semestres/supprimer/${listesemestres.getIdSemestre()}"	var="deleteSemestre"></c:url>
																<a href="${deleteSemestre}" class="btn btn-danger"><i class="fa fa-trash-o"></i>&nbsp;Supprimer</a>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>
												</td>
											</tr>
										</c:forEach>


									</tbody>
								</table>

							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-12 -->
				</div>

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/sb-admin-2.js"></script>
	<!-- DataTables JavaScript -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {	$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
</body>

</html>
