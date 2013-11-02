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
	              <a class="navbar-brand" href="#">Information</a>
	            </div>
	            <div class="navbar-collapse collapse">
	              <ul class="nav navbar-nav">
	                <li class="active"><a href="home">EnterTainment</a></li>
	                <li><a href="#about">Sports</a></li>
	                <li><a href="#contact">Contact</a></li>
	                <li class="dropdown">
	              </ul>
	            </div>
	          </div>
	        </div>
	      </div>
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
			</table>
			<button id="saveBt" class="btn btn-primary">Save</button>
			<h3 id="tables-contextual-classes">Star ProFile</h3>
		<div id = "profileSection"></div>
 		</div>
 		<div class="col-md-8" >
 			<div id="newsSection"></div>
 		</div>
 	</div>
	
 	<div class="row">
 		<div class = "col-xs-6 col-md-4" >
			<input type="text" id="search">
			<button id="searchBt" class="btn btn-success">SearCh</button>
		</div>
 		<div class="col-xs-6">
			<iframe src="http://naver.com" width="700" height="300"></iframe>
 		</div>
 	</div>
 </div>

<script type="text/javascript">
$(function(){
	var currentId = 0;
	
	var showNews = function(){
		$.getJSON('news', function(data){
			var item = data.news.socialpick.item;
			var show = '<table class="table table-bordered table-striped">';
			for(var i=0; i<item.length;i++){
				show += '<tr>';
				show += '<td>'+item[i].rank+'</td>';
				show += '<td><a href="'+item[i].link+'">'+item[i].keyword+'</a></td>';
				show += '<td>'+item[i].content.substring(0, 20)+'...</td>';
				show += '</tr>';
			}
			show += '</table>';
			$('#newsSection').html(show);
		});
	};
	showNews();
	
	$('#searchBt').on('click',function(){
		var searchStar = $('#search').val();
		$('#search').val('');
		$.getJSON("profile/search?"+$.param({searchStar : searchStar}),function(data){
			var search = data.starKey;
			var show = '<table class="table table-bordered table-striped">';
			for(var i=0; i<search.length;i++){
				show += '<tr>';
				show += '<td><a href="http://search.naver.com/search.naver?where=nexearch&query=' + search[i].name + '&sm=top_hty&fbm=1&ie=utf8">' + search[i].name + '</a></td>';
				show += '<td><a href="http://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&ie=utf8&query=' + search[i].company + '&x=-595&y=-51">' + search[i].company+'</a></td>';
				show += '<td>'+search[i].majorwork+'</td>';
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
			show +='</thead>';
			
			show +="<tbody>";

			for(var i=0; i<profile.length; i++){
				show += '<tr>';
				show += '<td><a href="http://search.naver.com/search.naver?where=nexearch&query=' + profile[i].name + '&sm=top_hty&fbm=1&ie=utf8">' + profile[i].name + '</a></td>';
				show += '<td><a href="http://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&ie=utf8&query=' + profile[i].company + '&x=-595&y=-51">'+profile[i].company+'</a></td>';
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
				$('#pfname').val(id.name);
				$('#pfcp').val(id.company);
				$('#pfmw').val(id.majorwork);
			});
		}
	});
		$('#saveBt').on('click',function(){
			console.log($('#pfname').val());
			console.log($('#pfcp').val());
			console.log($('#pfmw').val());
			
			var datas = {
					name : $('#pfname').val(),
					company : $('#pfcp').val(),
					majorwork : $('#pfmw').val(),
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
			});
		});
		profile();
	});
</script>
</body>
</html>
