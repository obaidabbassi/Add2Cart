        <%@ page import="java.util.List" %>
<%@ page import="com.example.add2cart.Entities.Products" %>
        <%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add to Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <jsp:include page="../../Boostrap/boostrap.jsp"/>
    <jsp:include page="components/header.jsp"/>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="js/index.js"></script>

      </head>
      <body id="body">


<%
    List<Products> products = null;
    try {
        products = (List<Products>) request.getAttribute("Products");


    } catch (Exception e) {
        e.printStackTrace();
    }


%>



<div class="container">
      <div class="accordion" id="accordionExample">


          <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      <h5 class="text-success">Add Products</h5>
                  </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                  <div class="accordion-body">
                      <div class="container add-items-card">


                          <div class="card">
                              <h5 class="card-header">Enter Products Details</h5>
                              <div class="card-body">


                                  <form action="/additems" method="post" name="Form" enctype="multipart/form-data" id="form">
                                      <div class="mb-3">
                                          <label for="exampleInputEmail1" class="form-label">Product Name</label>
                                          <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="PName">

                                      </div>
                                      <div class="mb-3">
                                          <label for="exampleInputPassword1" class="form-label">Product Price</label>
                                          <input type="number" class="form-control" id="exampleInputPassword1" name="PP">
                                      </div>


                                      <div class="mb-3">
                                          <label for="exampleInputPassword" class="form-label">Product Description</label>
                                          <input type="text" class="form-control" id="exampleInputPassword" name="PDes">
                                      </div>
                                      <div class="mb-3">
                                          <label for="formFile" class="form-label">Choose Product Picture</label>
                                          <input class="form-control" type="file" id="formFile" name="file">
                                      </div>



                                      <button type="submit" class="btn btn-primary" id="add-product-btn">Submit</button>
                                  </form>

                                <div class="container text-center">
                                    <span class="text-success" id="msg"></span>
                                </div>

                                  <div class="d-flex justify-content-center" id="loader" >
                                      <div class="spinner-border" role="status">
                                          <span class="visually-hidden">Loading...</span>
                                      </div>
                                  </div>




                              </div>
                          </div>



                      </div>
                  </div>
              </div>
          </div>
      </div>

      </div>



<%--view items portion start --%>

<div class="container mt-5">
    <div class="accordion" id="accordionExample5">


        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree1">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree1" aria-expanded="false" aria-controls="collapseThree1">
                    <h5 class="text-success">View Products</h5>

                </button>
            </h2>
            <div id="collapseThree1" class="accordion-collapse collapse" aria-labelledby="headingThree1" data-bs-parent="#accordionExample5">
                <div class="accordion-body">
                    <div class="container add-items-card">


<%--              implement search functionality here          --%>



                       <div class="container mb-3 d-flex" style="gap: 1%;">
                           <input type="search" name="search" class="form-control" placeholder="search products here" id="search-product">
                           <button class="btn btn-outline-success" id="search">Search</button>
                       </div>




               <div class="row" >

                   <%
                       if (products!=null){

                       for (Products p : products) {
%>

                       <div class="col-md-4 mb-2 product-col" >

                  <div class="card shadow p-3 mb-5 bg-body rounded product-card" >
                     <div class="card-header"><strong>Product Name : </strong><span class="text-success"> <%=p.getPName()%></span>
                     
                     
                     <div class="container text-center">

                         <img  class="img-fluid" src="images/<%=p.getProductName()%>" width="100px" height="100px">
                     </div>
                     
                     
                     
                     
                     </div>
                      
                      
                      <div class="card-body"><div class="card-title"><strong>Product Des : </strong><span><%=p.getPDes()%></span></div></div>
                      <div class="card-footer"><strong>Product Price : </strong><span class="text-info">Rs <%=p.getPP()%></span></div>
                   <div class="container text-center d-flex justify-content-center mx-3 "style="grid-gap: 10px;">
                       <form action="/id" method="post">

                           <button class="btn btn-warning mt-2 mb-2 w-20">Add to cart</button>

                           <input type="hidden" name="productId" value="<%=p.getPID()%>">

                       </form>
                       <form action="/buy" method="post">
                           <button class="btn btn-success mt-2 mb-2 w-20">Buy Now</button>


                           <input type="hidden" name="productId" value="<%=p.getPID()%>">

                       </form>
                   </div>


                  </div>



                       </div>

                   <%}

                   }
                   %>


               </div>






                    </div>
                </div>
            </div>
        </div>
    </div>

</div>



      </body>
      </html>