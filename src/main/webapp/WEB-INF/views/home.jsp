<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>profile</title>
	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<meta charset="utf-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
</head>

<body >
	
	<div class="navbar-wrapper">
	    <div class="container">
	
	        <div class="navbar navbar-inverse navbar-static-top">
	          <div class="container">
	            <div class="navbar-header">
	              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	              </button>
	              <a class="navbar-brand" href="#">Star Profile</a>
	            </div>
	            <div class="navbar-collapse collapse">
	              <ul class="nav navbar-nav">
	                <li class="active"><a href="#">Home</a></li>
	                <li><a href="#about">About</a></li>
	                <li><a href="#contact">Contact</a></li>
	                <li class="dropdown">
	              </ul>
	            </div>
	          </div>
	        </div>
	
	      </div>
	    </div>
	    
	    <div id="myCarousel" class="carousel slide">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active" align="center">
          <img src="http://tv01.search.naver.net/ugc?t=252x448&q=http://imgnews.naver.com/image/004/2013/10/18/A201310180149_1_59_20131018105002.jpg" data-src="holder.js/100%x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
        <div class="item" align="center">
          <img src="http://tv01.search.naver.net/ugc?t=252x448&q=http://blogfiles.naver.net/20130423_262/urbanclass_1366645534476uANX2_JPEG/30.jpg" data-src="holder.js/100%x500/auto/#777:#7a7a7a/text:Second slide" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
        <div class="item" align="center">
          <img src="http://tv01.search.naver.net/ugc?t=252x448&q=http://cafefiles.naver.net/20121219_186/www_hoho_1355885364163A2j7f_JPEG/02.jpg" data-src="holder.js/100%x500/auto/#777:#7a7a7a/text:Third slide" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>

 <div class="container">
 	<div class="row">
 		<div class="col-xs-6 col-md-4">
			<table class="table">
				<tr class = "active">
					<td>name : </td>
					<td><input id="pfname" type="text"></td>
				</tr>
				<tr class = "danger">
					<td>company : </td>
					<td> <input id="pfcp" type="text"></td>
				</tr>
				<tr class = "warning">
					<td>majorwork : </td>
					<td> <input id="pfmw" type = "text"></td>
				</tr>
				<tr class ="active">
					<td>link : </td>
					<td><input id="link" type = "text"></td>
				</tr>
			</table>
 		</div>
	 	<div class="col-xs-6 col-md-4">
	 	</div>
 	</div>
 	<div class="row">
		<button id="saveBt" class="btn btn-primary">Save</button>
 	</div>
 	<div class="row">
		<input type="text" id="search">
		<button id="searchBt" class="btn btn-success">SearCh</button>
 	</div>
 	<div class="row">
		<h2 id="tables-contextual-classes">Star ProFile</h2>
		   <div id = "profileSection"></div>
 		</div>
</div>


<script type="text/javascript">
$(function(){
	var currentId = 0;
	$('#searchBt').on('click',function(){
		var searchStar = $('#search').val();
		$('$search').val('');
		$.getJSON("profile/search?searchStar="+searchStar,function(data){
			var search = data.starKey;
			var show = '<table>';
			for(var i=0; i<search.length;i++){
				show += '<tr>';
				show += '<td>'+search[i].pfname+'</td>';
				show += '<td>'+search[i].pfcp+'</td>';
				show += '<td>'+search[i].pfmw+'<td>';
				show += '</tr>';
			}
			show += '</table>';
			$('#profileSection').html(show);
		});
	});
	
	var profile = function(){
		$.ajax({
			dataType :"json",
			type : "GET",
			url : "profile"
		}).done(function(data){
			var profile = data.profileList;
			var show = '<table class="table table-bordered table-striped">';
			show +='<thead>';
			show +='<th>name</th>';
			show +='<th>company</th>';
			show +='<th>majorwork</th>';
			show +='<th></th>';
			show +='<th></th>';
			show +='</thead>';
			
			show +="<tbody>";

			for(var i=0; i<profile.length; i++){
				show += '<tr>';
				show += '<td><a href="'+profile[i].link+'">'+profile[i].name+'</a></td>';
				show += '<td>'+profile[i].company+'</td>';
				show += '<td>'+profile[i].majorwork+'</td>';
				show += '<td><a href="#" class="remove" profileId="'+profile[i].id+'">X</a></td>';
				show += '<td><a href="#" class="update" profileId="'+profile[i].id+'">U</a></td>';
				show += '</tr>';
			}
			show +="<tbody>";
			show += '</table>';
			$('#profileSection').html(show);
		});
	};
	
		$('#profileSection').on('click', function(event){
			var target = $(event.target);
			if(target.hasClass('remove')){
				var datas={
						'_method' : 'DELETE'
				};
				var id = target.attr('profileId');
				$.ajax({
					dataType : "json",
					type : "POST",
					url : "profile/"+id,
					data : datas
				}).done(function(){
					profile();
				});
		}else if(target.hasClass('update')){
			var id = target.attr('profileId');
			currentId = id;
			$.ajax({
				dataType : "json",
				type : "GET",
				url : "profile/" +id
			}).done(function(data){
				var id = data.idKey;
				$('#pfname').val(id.pfname);
				$('#pfcp').val(id.pfcp);
				$('#pfmw').val(id.pfmw);
				$('#link').val(id.link);
			});
		}
	});
		$('#saveBt').on('click',function(){
			console.log($('#pfname').val());
			console.log($('#pfcp').val());
			console.log($('#pfmw').val());
			console.log($('#link').val());
			
			var datas = {
					name : $('#pfname').val(),
					company : $('#pfcp').val(),
					majorwork : $('#pfmw').val(),
					link : $('#link').val()
			};
			
			if(currentId != 0){
				datas['_method'] = "PUT",
				datas['id'] = currentId;
				currentId = 0;
			}
			
			$.ajax({
				dataType : "json",
				type : "POST",
				url : "profile",
				data : $.param(datas),
				headers : {'Content-Type' : 'application/x-www-form-urlencoded'}
			}).done(function(){
				profile();
				$('#pfname').val('');
				$('#pfcp').val('');
				$('#pfmw').val('');
				$('#link').val('');
			});
		});
		profile();
	});
</script>
</body>
</html>
