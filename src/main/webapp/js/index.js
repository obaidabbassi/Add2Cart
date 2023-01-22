

 $("#toggler").on('click',()=>{


     $("#body").toggleClass("dark")

     $("dark").toggleClass("dark")
 })



 $("#checkout").on('click',()=>{



 })


 $(function () {

     $("#loader").addClass("d-none");
     $("#add-product-btn").on('click',()=>{

         $("#loader").removeClass("d-none");




     })
     $("#form").on('submit',(e)=>{


         e.preventDefault();



         $.ajax({
             url: '/additems',
             type: 'POST',
             data: new FormData($("#form")[0]),
             enctype: 'multipart/form-data',
             processData: false,  // tell jQuery not to process the data
             contentType: false,  // tell jQuery not to set contentType
             success: function(response) {
                 // handle the response here
                 $("#loader").addClass("d-none");
                 console.log(response+"successfully uploaded");
$("#msg").html('Product Successfully uploaded');
                 $("#form")[0].reset();
             }
         });




         })




 })
