<%@ page import="com.example.add2cart.Entities.Products" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.ArrayList" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page isELIgnored="false" %>--%>

<%
    HttpSession httpSession=request.getSession();
    List<Products> cartproducts= null;
    List<Products>Cart=new ArrayList<>();
    int number=0;
    try {
    cartproducts = (List<Products>) httpSession.getAttribute("cart");


    } catch (Exception e) {
        e.printStackTrace();
    }

if (cartproducts!=null){

    number = cartproducts.size();
    Cart=cartproducts;

}
%>






<nav class="navbar navbar-expand-lg bg-light shadow-sm p-3 mb-5 bg-body rounded dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><h3>E-CommerceWalla</h3></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent1">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 mr-5">

                <div class="My form-check form-switch" id="toggler">
                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">


                    <i class="fa-solid fa-moon"></i>


                </div>


            </ul>
            <form class="d-flex" role="search" style="margin-right:20%;">





                <!-- Button trigger modal -->
                <button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">


                    <i class="fa-solid fa-cart-shopping" style="font-size: 1.4rem;color: #656565"></i><span class="badge text-bg-secondary" style="color:white;background: red;border-radius: 100%;padding-left: 7px;padding-right: 6px;position: relative;top:-18px;"><%=number%></span>


                </button>

                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel1" aria-hidden="true">
                    <div class="modal-dialog" style="margin-right: 20%;margin-top: 4%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel1">Product Details</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">


<%--                        //your logic is here to--%>

                                <%

                                try {

                                if (cartproducts!=null){


                             for (Products productsList:cartproducts){
                                %>



    <div class="card mb-5">
        <div class="card-header"><strong>Product Name : </strong><span class="text-success"><%=productsList.getPName()%></span></div>
        <div class="card-body"><div class="card-title"><strong>Product Des : </strong><span><%=productsList.getPDes()%></span></div></div>
        <div class="card-footer"><strong>Product Price : </strong><span><%=productsList.getPP()%></span></div>
        <div class="container text-center">
            <form action="/deleteProduct" method="post">
                <button class="btn btn-danger mt-2 mb-2 w-50" id="del">Delete Product</button>
                <input type="hidden" name="productId" value="<%=productsList.getPID()%>">

            </form>
        </div>


    </div>






  <%
              }   }
                                } catch (Exception e){e.printStackTrace();}



  %>

















                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Checkout</button>
                            </div>
                        </div>
                    </div>
                </div>







            </form>
        </div>
    </div>
</nav>