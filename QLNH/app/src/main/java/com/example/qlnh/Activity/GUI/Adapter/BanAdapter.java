package com.example.qlnh.Activity.GUI.Adapter;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.example.qlnh.Activity.BUS.Ban;
import com.example.qlnh.Activity.Interface.ClickItemBan;
import com.example.qlnh.R;

import java.util.ArrayList;
import java.util.List;

public class BanAdapter extends RecyclerView.Adapter<BanAdapter.BanViewHolder>  {

    private ArrayList<Ban> ListBan ;
    private ClickItemBan clickItemBan;


    public BanAdapter(ClickItemBan clickItemBan) {
        this.clickItemBan = clickItemBan;
    }


    @NonNull
    @Override
    public BanViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_ban,parent,false);
        return new BanViewHolder(view);
    }

    @SuppressLint("ResourceAsColor")
    @Override
    public void onBindViewHolder(@NonNull BanViewHolder holder, int position) {
        Ban ban  = ListBan.get(position);
        if(ban == null)
        {
            return;
        }
        holder.tv_TenBan.setText(ban.getTenBan());
        //
        switch (ban.getTrangThai().toString())
        {
            case "Đang dùng":
                holder.ban_layout.setBackgroundResource(R.drawable.restaurant);
                break;
            case "Đặt trước":
                holder.cardView.setCardBackgroundColor(R.color.Backmix);


        }
        //sự kiện
        holder.ban_layout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                clickItemBan.OnClickItemBan(ban);
            }
        });


    }

    @Override
    public int getItemCount() {
        if(ListBan != null)
        {
            return ListBan.size();
        }
        return 0;
    }

    public void setdata(ArrayList<Ban> listBan)
    {
        this.ListBan = listBan;
    }

    public class BanViewHolder extends RecyclerView.ViewHolder {
        private ConstraintLayout ban_layout;
        private TextView tv_TenBan;
        private CardView cardView;
        public BanViewHolder(@NonNull View itemView) {
            super(itemView);
            tv_TenBan = itemView.findViewById(R.id.tv_TenBan);
            ban_layout = itemView.findViewById(R.id.ban_layout);
            cardView = itemView.findViewById(R.id.backround);

        }
    }
}
