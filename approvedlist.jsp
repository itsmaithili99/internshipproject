<%-- 
    Document   : approvedlist
    Created on : 7 Nov, 2020, 1:00:43 PM
    Author     : User
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link ref="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
          <section id="blog" class="container">
            <div class="center">
                <h2>Aprroved list </h2>
            </div>
            <div class="blog">
                <div class="row">
                    <div class="col-md-12">
                        <%
                            String error;
                            if ( session.getAttribute("userId").equals("1")) { %>
                        <table class="table table-condensed table-bordered">
                            <thead> <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>City </th>
                                    <th>Phone</th>
                                    <th>Car Registration Number</th>
<!--                                    <th>active</th>-->
                                </tr> </thead>
                                <%
                                    try {
                                          Class.forName("com.mysql.jdbc.Driver");
                                        // Get connection object from ConnectionProvider.java
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental", "root", "ROOT");
                                        // Prepare SQL query
                                        PreparedStatement ps = conn.prepareStatement("select *,regNo from rentalrequest,user where status like 'Ac%' AND rentalrequest.userId=user.userId");
                                        ResultSet rs = ps.executeQuery();
                                        int count = 1;
                                        while (rs.next()) {
                                            String statusClass = "";
                                            if (rs.getString("userId")!=null) {
                                                statusClass = "";
                                            } else {
                                                statusClass = "danger";
                                            }
                                %>

                            <tr class="<%=statusClass%>">
                                <td><%= count++%></td>
                                
                                <td><%= rs.getString("name")%></td>
                                <td><%= rs.getString("email")%></td>
                                <td><%= rs.getString("address")%></td>
                                <td><%= rs.getString("city")%></td>
                                <td><%= rs.getString("phone")%></td>
                                 <td><%= rs.getString("regNo")%></td>
                               
                            </tr>
                            <%
                                    }
                                } catch (Exception ex) {
                                    StringWriter errors = new StringWriter();
                                    ex.printStackTrace(new PrintWriter(errors));
                                    error = "exception" + errors.toString();
                                    out.println(error);
                                }
                            %>
                        </table>
                        <% } else { %>
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            <strong> Please login: </strong> You must be logged-in to view this page
                        </div>                           
                        <% }%>
                    </div>
                </div><!--/.row-->
            </div>
        </section>
    <center>
                     <form id="mail" method="post" action="mail">
                         <h3>Enter mail id to send confirmation</h3>
              
                <div class="form-group">
                    <div>
                        <input id="email" class="form-control" style="width:70%" type="text" placeholder="Email" name="email" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <div  style="width:100%">
                        <input type="submit" name="sendmail" value="Submit" >
                    </div>
                </div> 
            </form> 
    </center>
       <div style="background-color:#03045E">
            <center style="background-color:#03045E">
                <div class="bg-blue py-4 ">
                    <h5 style=" color: #fff;font-size: 20px;">Copyright &copy; 2021. All rights reserved</h5><br>
                    <div class="social-contact ml-4 ml-sm-auto"> <span class="fa fa-facebook mr-4 text-sm"></span> <span class="fa fa-google-plus mr-4 text-sm"></span> <span class="fa fa-linkedin mr-4 text-sm"></span> <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span> 
                    </div>
                </div>
            </center>
        </div>
    </body>
</html>

