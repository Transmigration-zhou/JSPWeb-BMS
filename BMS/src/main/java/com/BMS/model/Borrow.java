package com.BMS.model;

public class Borrow {
    private int borrow_id;
    private int b_id;
    private int u_id;

    public Borrow(int borrow_id, int b_id, int u_id) {
        this.borrow_id = borrow_id;
        this.b_id = b_id;
        this.u_id = u_id;
    }

    public int getBorrow_id() {
        return borrow_id;
    }

    public void setBorrow_id(int borrow_id) {
        this.borrow_id = borrow_id;
    }

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }
}
