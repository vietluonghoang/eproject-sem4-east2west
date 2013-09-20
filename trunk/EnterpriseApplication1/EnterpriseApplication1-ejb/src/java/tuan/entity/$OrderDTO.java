/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tuan.entity;

import java.util.Date;

/**
 *
 * @author Anh Tuan
 */
public class $OrderDTO {
    private int $carID,$quantity,$price,$inStock;
    private Date $pickup,$dropoff;
    private boolean $driver,$deleted;
    private String $model;

    public $OrderDTO(int $carID, String $model, int $price, int $quantity, int $inStock, Date $pickup, Date $dropoff, boolean $driver) {
        this.$carID = $carID;
        this.$model = $model;
        this.$price = $price;
        this.$quantity = $quantity;
        this.$inStock = $inStock;
        this.$pickup = $pickup;
        this.$dropoff = $dropoff;
        this.$driver = $driver;
        this.$deleted = false;
    }

    public $OrderDTO() {
    }

    public int get$price() {
        return $price;
    }

    public void set$price(int $price) {
        this.$price = $price;
    }
    
    public int get$carID() {
        return $carID;
    }

    public void set$carID(int $carID) {
        this.$carID = $carID;
    }

    public boolean is$driver() {
        return $driver;
    }

    public void set$driver(boolean $driver) {
        this.$driver = $driver;
    }

    public boolean is$deleted() {
        return $deleted;
    }

    public void set$deleted(boolean $driver) {
        this.$deleted = $driver;
    }

    public Date get$dropoff() {
        return $dropoff;
    }

    public void set$dropoff(Date $dropoff) {
        this.$dropoff = $dropoff;
    }

    public Date get$pickup() {
        return $pickup;
    }

    public void set$pickup(Date $pickup) {
        this.$pickup = $pickup;
    }

    public int get$quantity() {
        return $quantity;
    }

    public void set$quantity(int $quantity) {
        this.$quantity = $quantity;
    }

    public int get$inStock() {
        return $inStock;
    }

    public void set$inStock(int $inStock) {
        this.$inStock = $inStock;
    }

    public String get$model() {
        return $model;
    }

    public void set$model(String $model) {
        this.$model = $model;
    }
}
