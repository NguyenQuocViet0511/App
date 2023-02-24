package com.example.qlnh.Activity.GUI.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.qlnh.Activity.BUS.MonAn;
import com.example.qlnh.R;

import java.util.ArrayList;

public class OderAdapter extends RecyclerView.Adapter<OderAdapter.OderHolder>{

    Context context;
    ArrayList<MonAn> monAns;

    public OderAdapter(Context context) {
        this.context = context;
    }
    public void SetData(ArrayList<MonAn> monAns){
        this.monAns = monAns;

    }
    @NonNull
    @Override
    public OderHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_monanoder,parent,false);

        return new OderHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull OderHolder holder, int position) {
            MonAn monAn = monAns.get(position);
            if(monAns == null)
            {
                return;
            }
            double sum = 0 ;
            holder.tv_Soluong.setText(Integer.toString(monAn.getSoluong()));
            holder.tv_TenMon.setText(monAn.getTenMon());
            holder.Tv_Dongia.setText(Double.toString(monAn.getGiaTien()));
            sum = monAn.getGiaTien() * monAn.getSoluong();
            holder.tv_tongtien.setText(Double.toString(sum));



    }

    @Override
    public int getItemCount() {
        if(monAns != null)
        {
            return monAns.size();
        }
        return 0;
    }

    public class OderHolder extends RecyclerView.ViewHolder {
        TextView tv_Soluong,tv_TenMon,Tv_Dongia,tv_tongtien;
        public OderHolder(@NonNull View itemView) {
            super(itemView);
            tv_Soluong = itemView.findViewById(R.id.tv_Soluong);
            tv_TenMon = itemView.findViewById(R.id.tv_TenMon);
            Tv_Dongia = itemView.findViewById(R.id.tv_SoTien);
            tv_tongtien = itemView.findViewById(R.id.tv_TongTien);

        }
    }
}
