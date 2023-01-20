<%@ page import="java.util.List" %>
<%@ page import="com.example.add2cart.Entities.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Optional" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <jsp:include page="../../Boostrap/boostrap.jsp"/>
    <jsp:include page="components/header.jsp"/>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="js/index.js"></script>

</head>
<body id="body">


<%
    HttpSession httpSession=request.getSession();
   Optional<Products> Buy_now= null;

    int number=0;
    try {
        Buy_now =(Optional<Products>)httpSession.getAttribute("Buy_Now");


    } catch (Exception e) {
        e.printStackTrace();
    }


%>

<div class="container text-center">
<h1 class="text-warning">Your Buying Details are</h1>

</div>

<div class="container">


    <div class="card mb-5">
        <div class="card-header"><strong>Product Name : </strong><span class="text-success"><%=Buy_now.get().getPName()%></span></div>
        <div class="card-body"><div class="card-title"><strong>Product Des : </strong><span><%=Buy_now.get().getPDes()%></span></div></div>
        <div class="card-footer"><strong>Product Price : </strong><span><%=Buy_now.get().getPP()%></span></div>
        <div class="card-footer"><strong>Product Quantity : </strong><span><input type="number" value="1" min="1" max="100"class="form-control"></span></div>


        <div class="container text-center">

                <button class="btn btn-danger mt-2 mb-2 w-50"  id="checkout">Check out</button>





                <input type="hidden" name="productId" value="<%=Buy_now.get().getPID()%>">


        </div>


    </div>





</div>

<div class="container accordian " id="acc" style="display: none;">


    <div class="accordion " id="accordionPanelsStayOpenExample">


        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                    <h4 class="text-normal">Check out details</h4>
                </button>
            </h2>
            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                <div class="accordion-body">

                    <h3>Your total bill is :<span id="bill" class="text-info"></span></h3>
                    <button class="btn btn-outline-info">Pay Now</button>
                </div>
            </div>
        </div>
    </div>



</div>

<a href="index">Home</a>

<script>





    $("#checkout").on('click',()=>{
        let q=<%=Buy_now.get().getPP()%>;
        console.log(q)

        let inputVal = $("input[type='number']").val();
        console.log(inputVal)
let TotalPrice=q*inputVal;

$(".accordian").css("display","block");

$("#bill").html("PKR-"+TotalPrice);

    })


</script>


</body>
</html>