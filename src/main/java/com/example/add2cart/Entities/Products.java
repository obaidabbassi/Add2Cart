package com.example.add2cart.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import org.springframework.stereotype.Component;

@Component
@Entity
public class Products {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int PID;
    private int PP;

    public int getPID() {
        return PID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String productName) {
        ProductName = productName;
    }

    private String ProductName;
    public void setPID(int PID) {
        this.PID = PID;
    }

    public int getPP() {
        return PP;
    }

    public void setPP(int PP) {
        this.PP = PP;
    }

    private String PName;

    @Override
    public String toString() {
        return "Products{" +
                "Pid=" + PP +
                ", PName='" + PName + '\'' +
                ", PDes='" + PDes + '\'' +
                '}';
    }



    public String getPName() {
        return PName;
    }

    public void setPName(String PName) {
        this.PName = PName;
    }

    public String getPDes() {
        return PDes;
    }

    public void setPDes(String PDes) {
        this.PDes = PDes;
    }

    private String PDes;
}
