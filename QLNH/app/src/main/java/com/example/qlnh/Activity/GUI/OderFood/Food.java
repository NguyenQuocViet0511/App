package com.example.qlnh.Activity.GUI.OderFood;

import android.app.Dialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.qlnh.Activity.BUS.MonAn;
import com.example.qlnh.Activity.GUI.Adapter.MonAnAdapter;
import com.example.qlnh.Activity.GUI.Adapter.OderAdapter;
import com.example.qlnh.Activity.GUI.Main.Activity;
import com.example.qlnh.Activity.Interface.ClickChonMonAn;
import com.example.qlnh.R;

import java.util.ArrayList;

public class Food extends AppCompatActivity {
    Button btn_dongy,btn_huybo;
    EditText ed_timkiemmonan;

    ArrayList<MonAn> AnhXa;
    MonAnAdapter monAnAdapter;
    ArrayList<MonAn> monAns;
    RecyclerView rcv_monan;
   private int number = 1;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.oderfood);
        Addcontrols();
        AddEvent();
    }

    private void AddEvent() {

        ed_timkiemmonan.addTextChangedListener(new TextWatcher() {
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
        btn_huybo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(getApplicationContext(), Activity.class));


            }
        });
        btn_dongy.setOnClickListener(new View.OnClickListener() {
;            @Override
                public void onClick(View view) {
            }


        });
    }
    // khởi Tạo List Khi Add
    private void AddListOder(ArrayList<MonAn> lists ) {
        lists  = AnhXa;


    }
    public void timkiem(String text)
    {
        ArrayList<MonAn> timkiem = new ArrayList<>();
        for(MonAn item : monAns)
        {
            if(item.getTenMon().toLowerCase().contains(text.toLowerCase()))
            {
                timkiem.add(item);
            }
        }
        setManagerMonan(monAnAdapter,rcv_monan,timkiem);
    }
    public void setManagerMonan(MonAnAdapter monAnAdapter, RecyclerView rcv_monan, ArrayList<MonAn> monAns)
    {
        monAnAdapter.setData(monAns);
        LinearLayoutManager layoutManager =  new LinearLayoutManager(this,LinearLayoutManager.VERTICAL,false);
        rcv_monan.setLayoutManager(layoutManager);
        rcv_monan.setAdapter(monAnAdapter);
        rcv_monan.setHasFixedSize(true);
        monAnAdapter.notifyDataSetChanged();
    }



    //sự kiện thêm trừ món
    private void ChonMonAn(int ID,ArrayList<MonAn> List) {
            List = monAns;
        for (int i = 0; i < List.size(); i++){
            if(List.get(i).getID() == ID)
            {
                int sum = number + monAns.get(i).getSoluong();
                List.get(i).setSoluong(sum);
                List.get(i).setChon(true);
            }
            setManagerMonan(monAnAdapter, rcv_monan, List);
        }
    }
        private void TruMonAn(int ID,ArrayList<MonAn> List) {
            List = monAns;
            for (int i = 0; i < List.size(); i++){
                if(List.get(i).getID() == ID)
                {
                    if(monAns.get(i).getSoluong() > 0)
                    {
                        int sum =  monAns.get(i).getSoluong() - number;
                        List.get(i).setSoluong(sum);
                        List.get(i).setChon(true);
                    }
                    if(monAns.get(i).getSoluong() == 0){
                        List.get(i).setChon(false);

                    }
                }

                }
                setManagerMonan(monAnAdapter, rcv_monan, List);
            }




    //khỏi tạo dialog
    private void openDialog(int gravity) {
        final Dialog dialog = new Dialog(this);
//        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.customedialog);

        //khởi Tạo window
//        Window window = dialog.getWindow();
//        if(window == null)
//        {
//            return;
//        }

//        window.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.WRAP_CONTENT);
//        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
//        WindowManager.LayoutParams layoutParams = window.getAttributes();
//        layoutParams.gravity = gravity;
//
//        window.setAttributes(layoutParams);
//        setManagerOdermonAn(oderAdapter,rcv_oder,monAns);

        dialog.show();
//
    }

    private void Addcontrols() {
        // ánh xạ
        btn_dongy = findViewById(R.id.btn_dongy);
        btn_huybo = findViewById(R.id.btn_huybo);
        rcv_monan = findViewById(R.id.rcv_food);
        ed_timkiemmonan = findViewById(R.id.ed_timkiemmonan);
        //khởi tạo
        monAns = new ArrayList<>();
        AnhXa = new ArrayList<>();
        monAns.add(new MonAn(1,"Hamburger 1",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(2,"Hamburger 2",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(3,"Hamburger 3",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(4,"Hamburger 4",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(5,"Hamburger 5",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(6,"Hamburger 6",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(7,"Hamburger 7",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(8,"Hamburger 8",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(9,"Hamburger 9",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(10,"Hamburger 10",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(11,"Hamburger 11",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(12,"Hamburger 12",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(13,"Hamburger 13",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(14,"Hamburger 14",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(15,"Hamburger 15",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(16,"Hamburger 16",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(17,"Hamburger 17",12,1,80.000, 2,false,0));
        monAns.add(new MonAn(118,"Hamburger 18",12,1,80.000, 2,false,0));



        monAnAdapter = new MonAnAdapter(new ClickChonMonAn() {
            @Override
            public void ClickCongnMonAn(MonAn monAn) {
                ChonMonAn(monAn.getID(),AnhXa);

            }

            @Override
            public void ClicktruMonAn(MonAn monAn) {
                TruMonAn(monAn.getID(),AnhXa);
            }
        });

        setManagerMonan(monAnAdapter,rcv_monan,monAns);
        }
}
