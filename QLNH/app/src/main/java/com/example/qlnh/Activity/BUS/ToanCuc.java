package com.example.qlnh.Activity.BUS;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ToanCuc implements Serializable {
    public ArrayList<Ban> banList = new ArrayList<>();

    public ToanCuc()
    {

        banList.add(new Ban("1","1","Trống"));
        banList.add(new Ban("2","2","Đang dùng"));
        banList.add(new Ban("3","3","Trống"));
        banList.add(new Ban("4","4","Trống"));
        banList.add(new Ban("5","5","Trống"));
        banList.add(new Ban("6","6","Trống"));
        banList.add(new Ban("7","7","Đang dùng"));
        banList.add(new Ban("8","8","Trống"));
        banList.add(new Ban("9","9","Đặt trước"));
        banList.add(new Ban("10","V10","Trống"));
        banList.add(new Ban("9","V11","Trống"));
        banList.add(new Ban("10","V12","Đang dùng"));
        banList.add(new Ban("9","V13","Trống"));
        banList.add(new Ban("10","V14","Trống"));
        banList.add(new Ban("9","V15","Trống"));
        banList.add(new Ban("10","SS16","Đặt trước"));
        banList.add(new Ban("9","SS17","Trống"));
        banList.add(new Ban("10","SS18","Trống"));
        banList.add(new Ban("9","SS19","Đặt trước"));
        banList.add(new Ban("10","SS20","Trống"));
    }
}
