<%-- 
    Document   : index
    Created on : 23 oct. 2022, 20:32:24
    Author     : IVAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="apis.api_empleado" %>
<%@page import="javax.swing.table.DefaultTableModel" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>      
        <h1>Tabla Empleados</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Puesto</th>
                    <th>DPI</th>
                    <th>Fecha Nacimiento</th>
                    <th>Fecha Ingreso Registro</th>
                </tr>
            </thead>
            <tbody>
                <%
                    api_empleado api_e = new api_empleado();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = api_e.leer();
                    for (int t = 0; t < tabla.getRowCount(); t++) {
                        out.println("<tr data-id =" + tabla.getValueAt(t, 0) + " >");
                        out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                        out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                        out.println("</tr>");
                    }
                %>
            </tbody>
        </table>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script><!-- comment -->
    </body>
</html>