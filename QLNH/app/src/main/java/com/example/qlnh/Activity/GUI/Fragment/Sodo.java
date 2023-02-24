package com.example.qlnh.Activity.GUI.Fragment;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.qlnh.Activity.BUS.Ban;
import com.example.qlnh.Activity.BUS.ToanCuc;
import com.example.qlnh.Activity.GUI.Adapter.BanAdapter;
import com.example.qlnh.Activity.GUI.OderFood.Food;
import com.example.qlnh.Activity.Interface.ClickItemBan;
import com.example.qlnh.R;

import java.util.ArrayList;

public class Sodo extends Fragment {
    ArrayList<Ban> banList;
    ToanCuc  ToanCuc;
    BanAdapter banAdapter;
    RecyclerView rcv_Ban;
    TextView btn_loc;
    CheckBox ck_timkiem,ck_dattruoc,ck_dangan,ck_trong;
    EditText ed_timkiemban;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragmentsodo,container,false);

        return view;


    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        // ánh xạ
        rcv_Ban = view.findViewById(R.id.rcv_Ban);
        btn_loc = view.findViewById(R.id.btn_loc);
        ck_timkiem = view.findViewById(R.id.ck_timkiem);
        ed_timkiemban = view.findViewById(R.id.ed_Timkiemban);
        ck_dattruoc  = view.findViewById(R.id.ck_dattruoc);
        ck_dangan  = view.findViewById(R.id.ck_dangan);
        ck_trong  = view.findViewById(R.id.ck_trong);

        //khởi tạo trước
        ed_timkiemban.setVisibility(View.INVISIBLE);

        // khỏi tạo mới

        Addcontrols();
        AddEvent();

    }

    private void AddEvent() {
//        btn_loc.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                openDialog(Gravity.CENTER);
//
//            }
//
//
//        });
       ck_timkiem.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View view) {
               if(ck_timkiem.isChecked())
               {
                   ck_dangan.setChecked(false);
                   ck_dattruoc.setChecked(false);
                   ck_trong.setChecked(false);
                   ed_timkiemban.setVisibility(View.VISIBLE);
               }
               else
               {
                   ed_timkiemban.setVisibility(View.INVISIBLE);
               }
           }
       });
       ck_trong.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View view) {
               if(ck_trong.isChecked())
               {
                   ck_dangan.setChecked(false);
                   ck_dattruoc.setChecked(false);
                   ck_timkiem.setChecked(false);
                   DuyetBan("Trống");
               }
               else {
                   setManagerBan(banAdapter,rcv_Ban,banList);

               }
           }


       });
        ck_dattruoc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(ck_dattruoc.isChecked())
                {
                    ck_timkiem.setChecked(false);
                    ck_dangan.setChecked(false);
                    ck_dangan.setChecked(false);
                    DuyetBan("Đặt trước");
                }
                else {
                    setManagerBan(banAdapter,rcv_Ban,banList);

                }
            }


        });
        ck_dangan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(ck_dangan.isChecked())
                {
                    ck_timkiem.setChecked(false);
                    ck_dattruoc.setChecked(false);
                    ck_trong.setChecked(false);
                    DuyetBan("Đang dùng");
                }
                else {
                    setManagerBan(banAdapter,rcv_Ban,banList);

                }
            }


        });

    //duyet khi tim kiếm
     ed_timkiemban.addTextChangedListener(new TextWatcher() {
         @Override
         public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

         }

         @Override
         public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

         }

         @Override
         public void afterTextChanged(Editable s) {
             timkiem(s.toString());

         }
     });

    }
    // tim kiem ban
    public void timkiem(String text)
    {
        ArrayList<Ban> timkiem = new ArrayList<>();
        for(Ban item : banList)
        {
            if(item.getTenBan().toLowerCase().contains(text.toLowerCase()))
            {
              timkiem.add(item);
            }
        }
        setManagerBan(banAdapter,rcv_Ban,timkiem);
    }
    //  duyệt lọt từng trang thái khi nhán

    private void DuyetBan(String text){
        ArrayList<Ban> duyetBam = new ArrayList<>();
        duyetBam.clear();
        for (Ban item : banList)
        {
            if(item.getTrangThai().equals(text)) {
                duyetBam.add(item);
            }
        }
        setManagerBan(banAdapter,rcv_Ban,duyetBam);
    }





    // tạo quản lí
    public void setManagerBan(BanAdapter banAdapter, RecyclerView rcv_Ban,ArrayList<Ban> banList)
    {
        banAdapter.setdata(banList);
        rcv_Ban.setLayoutManager(new GridLayoutManager(this.getContext(),3));
        rcv_Ban.setHasFixedSize(true);
        rcv_Ban.setAdapter(banAdapter);
        banAdapter.notifyDataSetChanged();
    }
    //khỏi tạo dialog
//    private void openDialog(int gravity) {
//        final Dialog dialog = new Dialog(getContext());
//        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
//        dialog.setContentView(R.layout.custome_dialog);
//
//        //khởi Tạo window
//        Window window = dialog.getWindow();
//        if(window == null)
//        {
//            return;
//        }
//
//        window.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.WRAP_CONTENT);
//        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
//        WindowManager.LayoutParams layoutParams = window.getAttributes();
//        layoutParams.gravity = gravity;
//
//        window.setAttributes(layoutParams);
//
//        dialog.show();
//
//    }
    // thêm cái điều khiên
    private void Addcontrols() {
        //
        banList = new ArrayList<>();
        banList.clear();
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
        //
        banAdapter = new BanAdapter(new ClickItemBan() {
            @Override
            public void OnClickItemBan(Ban ban) {
                startActivity(new Intent(getContext(), Food.class));

            }
        });
        setManagerBan(banAdapter,rcv_Ban,banList);
    }


}
