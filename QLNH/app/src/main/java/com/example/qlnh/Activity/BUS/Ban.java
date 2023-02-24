package com.example.qlnh.Activity.BUS;

import java.io.Serializable;

public class Ban implements Serializable {
    private String Maban;
    private String TenBan;
    private String TrangThai;

    public Ban()
    {

    }
    public Ban(String maban, String tenBan, String trangThai) {
        Maban = maban;
        TenBan = tenBan;
        TrangThai = trangThai;
    }

    public String getMaban() {
        return Maban;
    }

    public void setMaban(String maban) {
        Maban = maban;
    }

    public String getTenBan() {
        return TenBan;
    }

    public void setTenBan(String tenBan) {
        TenBan = tenBan;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(String trangThai) {
        TrangThai = trangThai;
    }


}
