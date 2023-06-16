<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <title>JSP - Hello World</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


</head>
<body>
<div style="
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
text-align: center;
min-height: 100vh; ">
    <form action="api/getData" method="post" id="form">
        <label>
            <input type="text" name="id" placeholder="ادخل رقم الهوية الوطنية" />
        </label>
        <button type="submit">Submit</button>
    </form>

    <table id="search-result">
        <thead>
        <th>رقم الملف</th>
        <th>الاسم</th>
        </thead>
        <tbody>
        <tr>
            <td id="folder-id"></td>
            <td id="emp-name"></td>
        </tr>
        </tbody>
    </table>

</div>
<script>
    $(document).ready(function() {
        $('form').submit(function(event) {
            event.preventDefault();
            var id = $('input[name="id"]').val();
            $.ajax({
                url: 'api/getData',
                type: 'GET',
                data: {id: id},
                dataType: 'json',
                success: function(response) {
                    console.log(response);
                    $('#folder-id').html(response.folderId);
                    $('#emp-name').html(response.name);
                },
                error: function(e) {
                    alert('Error occured + ' + e.message);
                }
            });
        });
    });

</script>
</body>
</html>