package com.example.qlnh.Activity.GUI.Fragment;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.qlnh.Activity.BUS.Ban;
import com.example.qlnh.Activity.GUI.Adapter.BanAdapter;
import com.example.qlnh.R;

import java.util.ArrayList;
import java.util.List;

public class GoiMon extends Fragment {
    RecyclerView Recyclerview;
    List<Ban> bans;
    BanAdapter banAdapter;
    @SuppressLint("MissingInflatedId")
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragmentgoimon,container,false);


        return view;
    }


}
