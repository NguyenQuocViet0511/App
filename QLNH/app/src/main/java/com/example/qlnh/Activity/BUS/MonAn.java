package com.example.qlnh.Activity.BUS;

import java.io.Serializable;

public class MonAn implements Serializable {
    private int ID;
    private String TenMon;
    private double GiamGia;
    private int Hinhanh;
    private double GiaTien;
    private int SolanBan;

    private boolean Chon;

    private int soluong;


    public MonAn()
    {

    }

    public MonAn(int ID, String tenMon, double giamGia, int hinhanh, double giaTien, int solanBan,boolean chon,int soluong) {
        this.ID = ID;
        this.TenMon = tenMon;
        this.GiamGia = giamGia;
        this.Hinhanh = hinhanh;
        this.GiaTien = giaTien;
        this.SolanBan = solanBan;
        this.Chon = chon;
        this.soluong = soluong;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTenMon() {
        return TenMon;
    }

    public void setTenMon(String tenMon) {
        TenMon = tenMon;
    }

    public double getGiamGia() {
        return GiamGia;
    }

    public void setGiamGia(double giamGia) {
        GiamGia = giamGia;
    }

    public int getHinhanh() {
        return Hinhanh;
    }

    public void setHinhanh(int hinhanh) {
        Hinhanh = hinhanh;
    }

    public double getGiaTien() {
        return GiaTien;
    }

    public void setGiaTien(double giaTien) {
        GiaTien = giaTien;
    }

    public int getSolanBan() {
        return SolanBan;
    }

    public void setSolanBan(int solanBan) {
        SolanBan = solanBan;
    }

    public boolean getChon() {
        return Chon;
    }

    public void setChon(boolean chon) {
        Chon = chon;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
}
