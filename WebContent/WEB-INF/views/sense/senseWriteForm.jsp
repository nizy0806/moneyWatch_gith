<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>senseWriteForm</title>
</head>
<body>
	<h1>당신의 sense를 입력하세요 관리자야^^</h1>
	
	<form action="senseWritePro.mw" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>
				제목 : <input type="text" id="sense_title" name="sense_title"/>
			</td>
		</tr>
		<tr>
			<td>
				메인 유무 : <input type="checkbox" id="main_set" name="main_set" value="0"/>			
			</td>
		</tr>
		<tr>
			<td>
				카테고리 : <!-- for문 돌려서 셀렉트 -->
					<select>
						<option></option>
					</select>
			</td>
		</tr>
		<tr>
			<td>
				내용 : <input type="text" id="sense_content" name="sense_content"/>
			</td>
		</tr>
		<tr>
			<td>
				URL : <input type="text" id="sense_url" name="sense_url"/>
			</td>
		</tr>
			<tr>
				<td>
					이미지 : <input type="file" id="sense_thumbnail" name="sense_thumbnail"><br/>
						  <input type="submit" value="전송"/>
				</td> 
			</tr>
	</table>
	</form>
</body>
</html>