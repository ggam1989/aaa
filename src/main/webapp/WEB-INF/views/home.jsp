<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>profile</title>
	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</head>
<table>
	<tr>
		<td>name : </td><td><input id="pfname" type="text"></td>
	</tr>
	<tr>
		<td>age : </td><td><input id="pfage" type="text"></td>
	</tr>
	<tr>
		<td>majorwork : </td><td><textarea id="pfmw"></textarea></td>
	</tr>
</table>
<body>
<button id="saveBt" class="btn btn-primary">Save</button>
<input type="text" id="search">
<button id="searchBt" class="btn btn-success">SearCh</button>
<div id = "profileSection"></div>
<script type="text/javascript">
$(function(){
	var currentId = 0;
	
	var profile = function(){
		
		$('#searchBt').on('click',function(){
			var serchstar = $('#search').val();
			$('$search').val('');
			$.getJSON("profile/serch?serchStar="+serchStar,function(data){
				var search = data.starKey;
				var show = '<table>';
				for(var i=0; i<search.length;i++){
					show += '<tr>';
					show += '<td>'+search[i].pfname+'</td>';
					show += '<td>'+search[i].pfage+'</td>';
					show += '<td>'+search[i].pfmw+'<td>';
					show += '</tr>';
				}
				show += '</table>';
				$('#profileSection').html(show);
			});
		});
		$.ajax({
			dataType :"json",
			type : "GET",
			url : "profile"
		}).done(function(data){
			var profile = data.profileKey;
			var show = '<table class="table table-striped">';
			for(var i=0; i<profile.length; i++){
				show += '<tr>';
				show += '<td>'+profile[i].pfname+'</td>';
				show += '<td>'+profile[i].pfage+'</td>';
				show += '<td>'+profile[i].pfmw+'</td>';
				show += '<td><a href="#" class="remove" profileId="'+profile[i].id+'">X</a></td>';
				show += '<td><a href="#" class="update" profileId="'+profile[i].id+'">U</a></td>';
				show += '</tr>';
			}
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
				$('#pfage').val(id.pfage);
				$('#pfmw').val(id.pfmw);
			});
		}
	});
		$('#saveBt').on('click',function(){
			console.log($('#pfname').val());
			console.log($('#pfage').val());
			console.log($('#pfmw').val());
			
			var datas = {
					name : $('#pfname').val(),
					age : $('#pfage').val(),
					majorwork : $('#pfmw').val()
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
				$('#pfage').val('');
				$('#pfmw').val('');
			});
		});
		profile();
	});
</script>
</body>
</html>
