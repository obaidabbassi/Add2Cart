package com.example.add2cart.Controllers;

import com.example.add2cart.Entities.Products;
import com.example.add2cart.ImageUploader;
import com.example.add2cart.Repository.ProductRepo;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

@Controller
public class Controllers {

    @Autowired
    ProductRepo productRepo;
    @Autowired
    ImageUploader imageUploader;
    @GetMapping("/home")
    String home(){

        System.out.println("this is my home controller running");
        return "index";
    }
    @GetMapping("/index")
    String main(){


        return "index";
    }



    @GetMapping("/about")
    String about(){

        System.out.println("this is my about controller running");
        return "About";
    }

    @PostMapping(path = "/additems")
    String add(@ModelAttribute Products products , @RequestParam("file") MultipartFile file){

//uploading image
        boolean upload = imageUploader.isUpload(file);

       products.setProductName(file.getOriginalFilename());
        System.out.println(upload);

        productRepo.save(products);
return "About";
    }

    @GetMapping({"","/"})

    String getAllProducts(Model model){

        List<Products> productList =productRepo.findAll();
        model.addAttribute("Products",productList);


return "index";
    }





    @PostMapping("/id")
    String getId(@RequestParam("productId") int productId, Model model, HttpSession httpSession){

        Optional<Products> byId = productRepo.findById(productId);


        List<Products>productsList=null;
if(byId.isPresent()){
    //it means item found push it to cart
    productsList = (List<Products>) httpSession.getAttribute("cart");

    //product is added to cart
    if(productsList == null){
        productsList = new ArrayList<>();
    }
    boolean add = productsList.add(byId.get());
    httpSession.setAttribute("cart",productsList);

}else {

    // cart is empty add items to cart




}







        return "index";
    }


    @PostMapping("/buy")
    String buy(@RequestParam("productId") int productId, Model model, HttpSession httpSession){

        Optional<Products> byId = productRepo.findById(productId);


httpSession.setAttribute("Buy_Now",byId);


        return "buy_items";
    }








    @PostMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("productId") int productId, HttpSession httpSession) {

        System.out.println(productId);
        List<Products> cart = (List<Products>) httpSession.getAttribute("cart");
        Iterator<Products> iterator = cart.iterator();
        while (iterator.hasNext()) {
            Products product = iterator.next();
            if (product.getPID() == productId) {
                iterator.remove();
                break;
            }
        }

        httpSession.setAttribute("cart", cart);

        if (cart.isEmpty()) {
            httpSession.removeAttribute("cart");
            return "index";
        }

        return "index";
    }






}
