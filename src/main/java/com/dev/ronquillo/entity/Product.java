package com.dev.ronquillo.entity;

public class Product {

    protected int id;
    protected String name;
    protected String type;
    protected double quantity;
    protected String quantityType;
    protected boolean isAvailable;
    protected String description;
    protected boolean favorite;

    public Product() {
    }

    public Product(int id, String name, String type, double quantity, String quantityType, boolean isAvailable, String description, boolean favorite) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.quantity = quantity;
        this.quantityType = quantityType;
        this.isAvailable = isAvailable;
        this.description = description;
        this.favorite = favorite;
    }
    public Product(int id, String name, String type, double quantity, String quantityType, boolean isAvailable, String description) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.quantity = quantity;
        this.quantityType = quantityType;
        this.isAvailable = isAvailable;
        this.description = description;
        this.favorite = false;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public String getQuantityType() {
        return quantityType;
    }

    public void setQuantityType(String quantityType) {
        this.quantityType = quantityType;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isFavorite() {
        return favorite;
    }

    public void setFavorite(boolean favorite) {
        this.favorite = favorite;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", quantity=" + quantity +
                ", quantityType='" + quantityType + '\'' +
                ", isAvailable=" + isAvailable +
                ", description='" + description + '\'' +
                '}';
    }
}
