package com.example.qlnh.Activity.GUI.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.example.qlnh.Activity.BUS.MonAn;
import com.example.qlnh.Activity.Interface.ClickChonMonAn;
import com.example.qlnh.R;

import java.util.ArrayList;

public class MonAnAdapter extends RecyclerView.Adapter<MonAnAdapter.MonAnHolder>{

    private ArrayList<MonAn> monAns;
    private ClickChonMonAn clickChonMonAn;


    public  MonAnAdapter(ClickChonMonAn clickChonMonAn){
        this.clickChonMonAn = clickChonMonAn;

    }


    public void setData(ArrayList<MonAn> monAns)
    {
        this.monAns = monAns;
    }
    @NonNull
    @Override
    public MonAnHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_monan,parent,false);

        return new MonAnHolder(view);
    }



    @Override
    public void onBindViewHolder(@NonNull MonAnHolder holder, int position) {
        MonAn monAn = monAns.get(position);
        if(monAns == null)
        {
            return;
        }
        holder.tv_TenMon.setText(monAn.getTenMon());
        holder.tv_SoTien.setText(Double.toString(monAn.getGiaTien()));
        holder.tv_solanchon.setText(Integer.toString(monAn.getSoluong()));
        //sự kiện
        if(monAn.getSoluong() > 0)
        {
            holder.btn_tru.setVisibility(View.VISIBLE);
            holder.tv_solanchon.setVisibility(View.VISIBLE);
        }
        else
        {
            holder.btn_tru.setVisibility(View.INVISIBLE);
            holder.tv_solanchon.setVisibility(View.INVISIBLE);
        }
        if(monAn.getChon() == true)
        {
            holder.layout_monan.setBackgroundResource(R.color.Backmix);
        }
        if(monAn.getChon() == false){
            holder.layout_monan.setBackgroundResource(R.color.white);

        }
        holder.btn_chonthem.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                clickChonMonAn.ClickCongnMonAn(monAn);
            }
        });
        holder.btn_tru.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                clickChonMonAn.ClicktruMonAn(monAn);
            }
        });


    }

    @Override
    public int getItemCount() {
        if(monAns != null)
        {
            return monAns.size();
        }
        return 0;
    }

    public class MonAnHolder extends RecyclerView.ViewHolder {
        private TextView tv_TenMon,tv_SoTien,btn_chonthem,tv_solanchon,btn_tru;
        private ConstraintLayout layout_monan;


        public MonAnHolder(@NonNull View itemView) {
            super(itemView);
            tv_TenMon = itemView.findViewById(R.id.tv_TenMon);
            tv_SoTien = itemView.findViewById(R.id.tv_SoTien);
            tv_solanchon = itemView.findViewById(R.id.tv_SoLanchon);
            btn_chonthem = itemView.findViewById(R.id.tv_chonthem);
            btn_tru = itemView.findViewById(R.id.btn_tru);
            layout_monan = itemView.findViewById(R.id.layout_monan);

        }
    }
}
